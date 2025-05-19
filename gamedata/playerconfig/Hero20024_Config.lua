-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20024_Config.lua

Hero20024_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20024_Config.animatorLayerConfig.BaseLayer = 0
Hero20024_Config.animatorLayerConfig.UpperBody = -1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillLP1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillHP1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillLL1] = 2
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillH1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillO1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillD1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillS1] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillLP2] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillHP2] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillLM2] = 5
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillH2] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillO2] = 2
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillD2] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillS2] = 1
Hero20024_Config.skillComboMax[Hero20024_Define.SkillType.SkillLM2C] = 5
Hero20024_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20024_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20024_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20024_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20024_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillLP1] = {
	Hero20024_Define.SkillType.SkillD1,
	Hero20024_Define.SkillType.SkillS1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillHP1] = {
	Hero20024_Define.SkillType.SkillD1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillLL1] = {
	Hero20024_Define.SkillType.SkillD1,
	Hero20024_Define.SkillType.SkillLP1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillH1] = {
	Hero20024_Define.SkillType.SkillD1,
	Hero20024_Define.SkillType.SkillLP1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillO1] = {}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillD1] = {
	Hero20024_Define.SkillType.SkillS1,
	Hero20024_Define.SkillType.SkillHP1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillS1] = {
	Hero20024_Define.SkillType.SkillD2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillLP2] = {
	Hero20024_Define.SkillType.SkillD2,
	Hero20024_Define.SkillType.SkillS2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillHP2] = {
	Hero20024_Define.SkillType.SkillD2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillLM2] = {
	Hero20024_Define.SkillType.SkillD2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillH2] = {
	Hero20024_Define.SkillType.SkillD2,
	Hero20024_Define.SkillType.SkillLP2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillO2] = {
	Hero20024_Define.SkillType.SkillD2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillD2] = {
	Hero20024_Define.SkillType.SkillS2,
	Hero20024_Define.SkillType.SkillHP1
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillS2] = {
	Hero20024_Define.SkillType.SkillD2
}
Hero20024_Config.skillComboSkill[Hero20024_Define.SkillType.SkillLM2C] = {}
Hero20024_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20024_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20024_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20024_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20024_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.PullFrontDizzy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillHitType[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.PullFrontDizzy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20024_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.Light
}
Hero20024_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.Light
}
Hero20024_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.Light
}
Hero20024_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.FrontFly
}
Hero20024_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20024_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillLP1] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillH1] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillO1] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillD1] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillLM2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillH2] = {
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillO2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillD2] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillS2] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[Hero20024_Define.SkillType.SkillLM2C] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20024_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20024_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20024_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillD1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillLM2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillD2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[Hero20024_Define.SkillType.SkillLM2C] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillMultiTarget[Hero20024_Define.SkillType.SkillLM2C] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20024_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillO1] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillBlockedEnable[Hero20024_Define.SkillType.SkillLM2C] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillLP2] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillHP2] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillLM2] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillH2] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillO2] = {
	false,
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillBlockedRebound[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillLP1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillHP1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillH1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillLP2] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillHP2] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillLM2] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillH2] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillO2] = {
	false,
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.hitHandEnable[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillLP1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillHP1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillH1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillLP2] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillHP2] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillLM2] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillH2] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillO2] = {
	false,
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.hitHandRebound[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillO1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillD1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillS1] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillCounterAttackedEnable[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillO1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillD1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillS1] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillCounterAttackedRebound[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20024_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillLP1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillHP1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillH1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillLP2] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillHP2] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillLM2] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillH2] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillO2] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillO1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillD1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillS1] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillParryEnable[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20024_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillLP1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillHP1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillLL1] = {
	true,
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillH1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillO1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillD1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillS1] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillLP2] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillHP2] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillLM2] = {
	true,
	true,
	true,
	true,
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillH2] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillO2] = {
	true,
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillD2] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillS2] = {
	true
}
Hero20024_Config.skillParryRebound[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20024_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillLP1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillHP1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillLL1] = {
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillH1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillO1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillD1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillS1] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillLP2] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillHP2] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillLM2] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillH2] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillO2] = {
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillD2] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillS2] = {
	false
}
Hero20024_Config.skillBeatBackEnable[Hero20024_Define.SkillType.SkillLM2C] = {
	false,
	false,
	false,
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20024_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20024_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20024_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20024_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillLP1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillHP1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillLL1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillH1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillD1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillS1] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillLP2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillHP2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillLM2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillH2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillO2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillD2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillS2] = {}
Hero20024_Config.skillHitCombo[Hero20024_Define.SkillType.SkillLM2C] = {}
Hero20024_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20024_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20024_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20024_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20024_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20024_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20024_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20024_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20024_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20024_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillLM2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[Hero20024_Define.SkillType.SkillLM2C] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillD1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillLM2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillO2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[Hero20024_Define.SkillType.SkillLM2C] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20024_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillLL1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillD1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillLM2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillO2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[Hero20024_Define.SkillType.SkillLM2C] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20024_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20024_Config
