-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20045_Config.lua

Hero20045_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20045_Config.animatorLayerConfig.BaseLayer = 0
Hero20045_Config.animatorLayerConfig.UpperBody = -1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillLLLL] = 4
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillLP] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillS] = 2
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillHHH1] = 3
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNHNH] = 2
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNHP] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillSP] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNDP] = 3
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillDP] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillND] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillOP1] = 4
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillOP2] = 3
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNLLL2] = 3
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNLP2] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillHPH2] = 2
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillHHH2] = 3
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNS2] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNSP2] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNOP2] = 1
Hero20045_Config.skillComboMax[Hero20045_Define.SkillType.SkillNO2] = 1
Hero20045_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNHNH] = {
	Hero20045_Define.SkillType.SkillNHNH
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNHP] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillSP] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNDP] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillDP] = {
	Hero20045_Define.SkillType.SkillOP1,
	Hero20045_Define.SkillType.SkillOP2
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillND] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillOP1] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillOP2] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNS2] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNSP2] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNOP2] = {}
Hero20045_Config.skillComboSkill[Hero20045_Define.SkillType.SkillNO2] = {}
Hero20045_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoopAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.HeavyTackle,
	AnimalBase_Define.HitType.FrontFly
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Up
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFlyFar,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.FrontFlyFar,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Light
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Down
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.HitType.Light
}
Hero20045_Config.skillHitType[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20045_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillLLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNHNH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNHP] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNDP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillDP] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillND] = {
	XCube.ShapeType.Point
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillOP1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillOP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNLP2] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillHPH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNS2] = {
	XCube.ShapeType.Point
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNSP2] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNOP2] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[Hero20045_Define.SkillType.SkillNO2] = {
	XCube.ShapeType.Cube
}
Hero20045_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20045_Config.skillAttackBoxType[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20045_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillLLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNHNH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNDP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillND] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillOP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillOP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillHPH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNSP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNOP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[Hero20045_Define.SkillType.SkillNO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNHNH] = {
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNHP] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNDP] = {
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillDP] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNLLL2] = {
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillHPH2] = {
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillMultiTarget[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20045_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillLP] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillND] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillOP1] = {
	true,
	false,
	false,
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNS2] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNSP2] = {
	true
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillBlockedEnable[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNHNH] = {
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNHP] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNDP] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillDP] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNLLL2] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillHPH2] = {
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillBlockedRebound[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNHNH] = {
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNHP] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNDP] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillDP] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNLLL2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillHPH2] = {
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.hitHandEnable[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNHNH] = {
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNHP] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNDP] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillDP] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNLLL2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillHPH2] = {
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.hitHandRebound[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillLP] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillSP] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillND] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillOP1] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNLP2] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNS2] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNSP2] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNOP2] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[Hero20045_Define.SkillType.SkillNO2] = {
	true
}
Hero20045_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillLP] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillSP] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillND] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillOP1] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNLP2] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNS2] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNSP2] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNOP2] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[Hero20045_Define.SkillType.SkillNO2] = {
	true
}
Hero20045_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNHNH] = {
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNHP] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNDP] = {
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillDP] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNLLL2] = {
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillHPH2] = {
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillLP] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillSP] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillND] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillOP1] = {
	true,
	false,
	false,
	false
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNLP2] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNS2] = {
	false
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNSP2] = {
	true
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillParryEnable[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillLP] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillSP] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillND] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillOP1] = {
	false,
	false,
	false,
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNLP2] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNS2] = {
	true
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNSP2] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNOP2] = {
	false
}
Hero20045_Config.skillParryRebound[Hero20045_Define.SkillType.SkillNO2] = {
	false
}
Hero20045_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillLP] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNHNH] = {
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNHP] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillSP] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNDP] = {
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillDP] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillND] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillOP1] = {
	true,
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNLLL2] = {
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNLP2] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillHPH2] = {
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNS2] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNSP2] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNOP2] = {
	true
}
Hero20045_Config.skillBeatBackEnable[Hero20045_Define.SkillType.SkillNO2] = {
	true
}
Hero20045_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillLLLL] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillLP] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillS] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillHHH1] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNHNH] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNHP] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillSP] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNDP] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillDP] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillND] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillOP1] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillOP2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNLLL2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNLP2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillHPH2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillHHH2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNS2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNSP2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNOP2] = {}
Hero20045_Config.skillHitCombo[Hero20045_Define.SkillType.SkillNO2] = {}
Hero20045_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNHNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillHPH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[Hero20045_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNHNH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNLP2] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillHPH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNOP2] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[Hero20045_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20045_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNHNH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNLP2] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillHPH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNOP2] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[Hero20045_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20045_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20045_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20045_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20045_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20045_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20045_Config
