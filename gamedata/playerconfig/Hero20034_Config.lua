-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20034_Config.lua

Hero20034_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20034_Config.animatorLayerConfig.BaseLayer = 0
Hero20034_Config.animatorLayerConfig.UpperBody = -1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillLL1] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillHH1] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNLL1] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNH1] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillHP1] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNLP] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillDP] = 3
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillD] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillLL2] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillHH2] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNLL2] = 2
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNHHH2] = 3
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillHP2] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillSP2] = 3
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillS2] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNSP2] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNS2] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillO2] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNO1] = 1
Hero20034_Config.skillComboMax[Hero20034_Define.SkillType.SkillNO2] = 1
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillLL1] = {
	Hero20034_Define.SkillType.SkillHH1,
	Hero20034_Define.SkillType.SkillNH1,
	Hero20034_Define.SkillType.SkillHP1
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillHH1] = {
	Hero20034_Define.SkillType.SkillHP1,
	Hero20034_Define.SkillType.SkillNH1
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNLL1] = {
	Hero20034_Define.SkillType.SkillHP1,
	Hero20034_Define.SkillType.SkillNH1
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNH1] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillHP1] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNLP] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillDP] = {
	Hero20034_Define.SkillType.SkillHP1,
	Hero20034_Define.SkillType.SkillD,
	Hero20034_Define.SkillType.SkillHP2,
	Hero20034_Define.SkillType.SkillO2,
	Hero20034_Define.SkillType.SkillNS2,
	Hero20034_Define.SkillType.SkillSP2
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillD] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillLL2] = {
	Hero20034_Define.SkillType.SkillHH2,
	Hero20034_Define.SkillType.SkillNHHH2,
	Hero20034_Define.SkillType.SkillHP2
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillHH2] = {
	Hero20034_Define.SkillType.SkillNHHH2,
	Hero20034_Define.SkillType.SkillHP2
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNLL2] = {
	Hero20034_Define.SkillType.SkillNHHH2,
	Hero20034_Define.SkillType.SkillHP2
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNHHH2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillHP2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillSP2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillS2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNSP2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNS2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillO2] = {}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNO1] = {
	Hero20034_Define.SkillType.SkillNLL1,
	Hero20034_Define.SkillType.SkillHP1
}
Hero20034_Config.skillComboSkill[Hero20034_Define.SkillType.SkillNO2] = {
	Hero20034_Define.SkillType.SkillNLL2,
	Hero20034_Define.SkillType.SkillHP2,
	Hero20034_Define.SkillType.SkillO2
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillNextType[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillMoveTypeList[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillRecoveryMoveTypeList[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.HitType.Down
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Down
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.None
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Light
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillHitType[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillTypeForAI[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNH1] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNLP] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillDP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillD] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillSP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillS2] = {
	XCube.ShapeType.Point
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNSP2] = {
	XCube.ShapeType.None
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNS2] = {
	XCube.ShapeType.Point
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillO2] = {
	XCube.ShapeType.Capsule
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNO1] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillColliderShape[Hero20034_Define.SkillType.SkillNO2] = {
	XCube.ShapeType.Cube
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillAttackBoxType[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNSP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillTargetType[Hero20034_Define.SkillType.SkillNO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	false,
	false
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillO2] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillMultiTarget[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.DamageType.None
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillDamageType[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillS2] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNSP2] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNS2] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillBlockedEnable[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNLL1] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNH1] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillHP1] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNLP] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillD] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNLL2] = {
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillHP2] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNO1] = {
	false
}
Hero20034_Config.skillBlockedRebound[Hero20034_Define.SkillType.SkillNO2] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNLL1] = {
	false,
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNH1] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillHP1] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNLP] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillD] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillS2] = {
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNSP2] = {
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNS2] = {
	true
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNO1] = {
	false
}
Hero20034_Config.hitHandEnable[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNLL1] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNH1] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillHP1] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNLP] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillD] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNLL2] = {
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillHP2] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNO1] = {
	false
}
Hero20034_Config.hitHandRebound[Hero20034_Define.SkillType.SkillNO2] = {
	false
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillS2] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNS2] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillO2] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillCounterAttackedEnable[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillCounterAttackedRebound[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNLL1] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNH1] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillHP1] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNLP] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillD] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNLL2] = {
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillHP2] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillSP2] = {
	false,
	false,
	true
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNO1] = {
	false
}
Hero20034_Config.skillCounterAttackedKeep[Hero20034_Define.SkillType.SkillNO2] = {
	false
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillS2] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNS2] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillParryEnable[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNLL1] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNH1] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillHP1] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNLP] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillD] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNLL2] = {
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNHHH2] = {
	true,
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillHP2] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillS2] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNS2] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNO1] = {
	true
}
Hero20034_Config.skillParryRebound[Hero20034_Define.SkillType.SkillNO2] = {
	true
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNLL1] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNH1] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillHP1] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNLP] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillD] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNLL2] = {
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNHHH2] = {
	false,
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillHP2] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillS2] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNSP2] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNS2] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillO2] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNO1] = {
	false
}
Hero20034_Config.skillBeatBackEnable[Hero20034_Define.SkillType.SkillNO2] = {
	false
}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillLL1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillHH1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNLL1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNH1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillHP1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNLP] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillDP] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillD] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillLL2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillHH2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNLL2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNHHH2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillHP2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillSP2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillS2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNSP2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNS2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillO2] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNO1] = {}
Hero20034_Config.skillHitCombo[Hero20034_Define.SkillType.SkillNO2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillLL1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillHH1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNLL1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNH1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillHP1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNLP] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillDP] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillD] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillLL2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillHH2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNLL2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNHHH2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillHP2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillSP2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillS2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNSP2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNS2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillO2] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNO1] = {}
Hero20034_Config.skillHitComboAI[Hero20034_Define.SkillType.SkillNO2] = {}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNO1] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20034_Config.skillRotationTypeAI[Hero20034_Define.SkillType.SkillNO2] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillHH1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNLP] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillHH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNO1] = {
	"BaseLayer"
}
Hero20034_Config.skillLayer[Hero20034_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillHH1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNLP] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillHH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNO1] = {
	"BaseLayer"
}
Hero20034_Config.skillRecoveryLayer[Hero20034_Define.SkillType.SkillNO2] = {
	"BaseLayer"
}
Hero20034_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20034_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20034_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20034_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20034_Config
