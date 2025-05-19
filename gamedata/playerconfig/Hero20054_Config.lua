-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20054_Config.lua

Hero20054_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20054_Config.animatorLayerConfig.BaseLayer = 0
Hero20054_Config.animatorLayerConfig.UpperBody = -1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillLLL1] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillHHHH1] = 4
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillS1] = 2
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillOO1] = 2
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillHP1] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillLP1] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillNS1] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillSP1] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillOP1] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillLLL2] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillLP2] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillHHH2] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillSP2] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillHPO2] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillDDDO2] = 4
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillDP2] = 2
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillNSP2] = 3
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillO2] = 1
Hero20054_Config.skillComboMax[Hero20054_Define.SkillType.SkillOP2] = 1
Hero20054_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillLLL1] = {
	Hero20054_Define.SkillType.SkillOO1
}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillHHHH1] = {
	Hero20054_Define.SkillType.SkillOO1
}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillS1] = {
	Hero20054_Define.SkillType.SkillNS1
}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillOO1] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillHP1] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillLP1] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillNS1] = {
	Hero20054_Define.SkillType.SkillLLL1,
	Hero20054_Define.SkillType.SkillHHHH1
}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillSP1] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillOP1] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillLLL2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillLP2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillHHH2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillSP2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillHPO2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillDDDO2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillDP2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillNSP2] = {}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillO2] = {
	Hero20054_Define.SkillType.SkillO2,
	Hero20054_Define.SkillType.SkillOP2
}
Hero20054_Config.skillComboSkill[Hero20054_Define.SkillType.SkillOP2] = {}
Hero20054_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.None
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.Light
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Light
}
Hero20054_Config.skillHitType[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.None
}
Hero20054_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20054_Config.skillTypeForAI[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20054_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillHHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillOO1] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillLP1] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillNS1] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillSP1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillOP1] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillSP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillHPO2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillDDDO2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillDP2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillNSP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillO2] = {
	XCube.ShapeType.Point
}
Hero20054_Config.skillColliderShape[Hero20054_Define.SkillType.SkillOP2] = {
	XCube.ShapeType.None
}
Hero20054_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillAttackBoxType[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20054_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillHHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillOO1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillNS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillSP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillOP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillHPO2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillDDDO2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillDP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillNSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[Hero20054_Define.SkillType.SkillOP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillOO1] = {
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillHP1] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillLP1] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillNS1] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillOP1] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillLP2] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillHPO2] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillDDDO2] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillNSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillO2] = {
	false
}
Hero20054_Config.skillMultiTarget[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillDamageType[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.DamageType.None
}
Hero20054_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillBlockedEnable[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillOO1] = {
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillHP1] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillLP1] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillNS1] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillOP1] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillLP2] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillHPO2] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillDDDO2] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillNSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillO2] = {
	false
}
Hero20054_Config.skillBlockedRebound[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillOO1] = {
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillHP1] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillLP1] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillNS1] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillOP1] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillLP2] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillHPO2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillDDDO2] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillNSP2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillO2] = {
	false
}
Hero20054_Config.hitHandEnable[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillOO1] = {
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillHP1] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillLP1] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillNS1] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillOP1] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillLP2] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillHPO2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillDDDO2] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillNSP2] = {
	false,
	false,
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillO2] = {
	false
}
Hero20054_Config.hitHandRebound[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillDP2] = {
	true,
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[Hero20054_Define.SkillType.SkillOP2] = {
	true
}
Hero20054_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillDP2] = {
	true,
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[Hero20054_Define.SkillType.SkillOP2] = {
	true
}
Hero20054_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillOO1] = {
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillHP1] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillLP1] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillNS1] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillOP1] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillLP2] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillHPO2] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillDDDO2] = {
	false,
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillDP2] = {
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillNSP2] = {
	false,
	false,
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillO2] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[Hero20054_Define.SkillType.SkillOP2] = {
	false
}
Hero20054_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillDP2] = {
	true,
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillParryEnable[Hero20054_Define.SkillType.SkillOP2] = {
	true
}
Hero20054_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillDP2] = {
	true,
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillParryRebound[Hero20054_Define.SkillType.SkillOP2] = {
	true
}
Hero20054_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillS1] = {
	false,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillOO1] = {
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillHP1] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillLP1] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillNS1] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillSP1] = {
	true,
	false,
	false
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillOP1] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillLP2] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillHPO2] = {
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillDDDO2] = {
	true,
	true,
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillDP2] = {
	true,
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillNSP2] = {
	true,
	true,
	false
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillO2] = {
	true
}
Hero20054_Config.skillBeatBackEnable[Hero20054_Define.SkillType.SkillOP2] = {
	true
}
Hero20054_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillLLL1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillHHHH1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillS1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillOO1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillHP1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillLP1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillNS1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillSP1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillOP1] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillLLL2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillLP2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillHHH2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillSP2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillHPO2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillDDDO2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillDP2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillNSP2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillO2] = {}
Hero20054_Config.skillHitCombo[Hero20054_Define.SkillType.SkillOP2] = {}
Hero20054_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20054_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillOO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillHPO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillDDDO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillDP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[Hero20054_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillS1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillOO1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillNS1] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillSP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillOP1] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillHPO2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillDDDO2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillDP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillNSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[Hero20054_Define.SkillType.SkillOP2] = {
	"BaseLayer"
}
Hero20054_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillS1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillOO1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillNS1] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillSP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillOP1] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillHPO2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillDDDO2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillDP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillNSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[Hero20054_Define.SkillType.SkillOP2] = {
	"BaseLayer"
}
Hero20054_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20054_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20054_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20054_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20054_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20054_Config
