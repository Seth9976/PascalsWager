-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20044_Config.lua

Hero20044_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20044_Config.animatorLayerConfig.BaseLayer = 0
Hero20044_Config.animatorLayerConfig.UpperBody = -1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillLL1] = 2
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillLP1] = 2
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillHHHH1] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNHHHH1] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillSP] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillHP] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNLLLL1] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillO1] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillOP1] = 3
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNLP1] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillLL2] = 2
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillLP2] = 2
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillHHH2] = 3
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNHHH2] = 3
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNLLLL2] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNS2] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNSP2] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNO2] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillO2] = 1
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillOP2] = 4
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNOP2] = 6
Hero20044_Config.skillComboMax[Hero20044_Define.SkillType.SkillNLP2] = 1
Hero20044_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20044_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 1
Hero20044_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillLP1
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillNLLLL1
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillSP] = {}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillO1,
	Hero20044_Define.SkillType.SkillNLLLL2,
	Hero20044_Define.SkillType.SkillNLP2
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillLP2,
	Hero20044_Define.SkillType.SkillNS2,
	Hero20044_Define.SkillType.SkillNSP2
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillNHHH2
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillNHHH2
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20044_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20044_Define.SkillType.SkillHP,
	Hero20044_Define.SkillType.SkillHHHH1,
	Hero20044_Define.SkillType.SkillNHHHH1,
	Hero20044_Define.SkillType.SkillNLLLL1,
	Hero20044_Define.SkillType.SkillLL1,
	Hero20044_Define.SkillType.SkillLL2,
	Hero20044_Define.SkillType.SkillHHH2,
	Hero20044_Define.SkillType.SkillNHHH2,
	Hero20044_Define.SkillType.SkillNS2
}
Hero20044_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20044_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Up
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Down
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.Light
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Down
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.HitType.FrontFlyFar,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitType[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20044_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20044_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20044_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillLP1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillHHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNHHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNLLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillO1] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillOP1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNLP1] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNLLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNS2] = {
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNSP2] = {
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNO2] = {
	XCube.ShapeType.Point
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillO2] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillOP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNOP2] = {
	XCube.ShapeType.Capsule,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20044_Config.skillColliderShape[Hero20044_Define.SkillType.SkillNLP2] = {
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20044_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20044_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillLP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillHHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.None
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNHHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNLLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillOP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNLLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNSP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillOP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNOP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[Hero20044_Define.SkillType.SkillNLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillLP2] = {
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNLLLL2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillMultiTarget[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20044_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillLP1] = {
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillHP] = {
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillO1] = {
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNLP1] = {
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNO2] = {
	true
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedEnable[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillLP2] = {
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNLLLL2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBlockedRebound[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillOP1] = {
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNLP1] = {
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNS2] = {
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNSP2] = {
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNO2] = {
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillO2] = {
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillOP2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNOP2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero20044_Config.hitHandEnable[Hero20044_Define.SkillType.SkillNLP2] = {
	true
}
Hero20044_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20044_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillLP2] = {
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNLLLL2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.hitHandRebound[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillLP1] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillHP] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillO1] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNLP1] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNS2] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNSP2] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNO2] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillO2] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNOP2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedEnable[Hero20044_Define.SkillType.SkillNLP2] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20044_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillLP1] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillHP] = {
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillO2] = {
	true
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedRebound[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20044_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillLP2] = {
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNLLLL2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillCounterAttackedKeep[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillLP1] = {
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillHP] = {
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNO2] = {
	true
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryEnable[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillLP1] = {
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillHP] = {
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillLP2] = {
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNLLLL2] = {
	true,
	true,
	true,
	true
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillParryRebound[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillLP1] = {
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillHP] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillO1] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillOP1] = {
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNLP1] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillLP2] = {
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNLLLL2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNS2] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNSP2] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNO2] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillO2] = {
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillOP2] = {
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNOP2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero20044_Config.skillBeatBackEnable[Hero20044_Define.SkillType.SkillNLP2] = {
	false
}
Hero20044_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20044_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20044_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillLL1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillLP1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillHHHH1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNHHHH1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillSP] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillHP] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNLLLL1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillO1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillOP1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNLP1] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillLL2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillLP2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillHHH2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNHHH2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNLLLL2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNS2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNSP2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNO2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillO2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillOP2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNOP2] = {}
Hero20044_Config.skillHitCombo[Hero20044_Define.SkillType.SkillNLP2] = {}
Hero20044_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20044_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20044_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20044_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNHHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNLLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNLLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[Hero20044_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20044_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillLP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNLP1] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillLP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNLLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillLayer[Hero20044_Define.SkillType.SkillNLP2] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20044_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillLP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNLP1] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillLP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNLLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[Hero20044_Define.SkillType.SkillNLP2] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20044_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20044_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20044_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20044_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20044_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20044_Config
