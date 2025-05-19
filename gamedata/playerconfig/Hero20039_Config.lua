-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20039_Config.lua

Hero20039_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20039_Config.animatorLayerConfig.BaseLayer = 0
Hero20039_Config.animatorLayerConfig.UpperBody = -1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillLLLL1] = 4
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillH1] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillHPHHH1] = 4
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillLPLLL1] = 4
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillO1] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillOP1] = 2
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillLLL2] = 3
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillLP2] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillHHHHH2] = 4
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillHP2] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillSSS2] = 3
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillOP21] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillOP22] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillDP] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillS1] = 1
Hero20039_Config.skillComboMax[Hero20039_Define.SkillType.SkillNS1] = 1
Hero20039_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20039_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 2
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillLLLL1] = {
	Hero20039_Define.SkillType.SkillH1,
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillH1] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillHPHHH1] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillLPLLL1] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillO1] = {
	Hero20039_Define.SkillType.SkillH1,
	Hero20039_Define.SkillType.SkillLLLL1,
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillOP1] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillLLL2] = {
	Hero20039_Define.SkillType.SkillLP2,
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillLP2] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillHHHHH2] = {
	Hero20039_Define.SkillType.SkillHP2,
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillHP2] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillSSS2] = {
	Hero20039_Define.SkillType.SkillDP
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillOP21] = {
	Hero20039_Define.SkillType.SkillDP,
	Hero20039_Define.SkillType.SkillHHHHH2
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillOP22] = {
	Hero20039_Define.SkillType.SkillDP,
	Hero20039_Define.SkillType.SkillLP2,
	Hero20039_Define.SkillType.SkillHP2
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillDP] = {
	Hero20039_Define.SkillType.SkillH1,
	Hero20039_Define.SkillType.SkillO1,
	Hero20039_Define.SkillType.SkillLP2,
	Hero20039_Define.SkillType.SkillOP22,
	Hero20039_Define.SkillType.SkillLLLL1,
	Hero20039_Define.SkillType.SkillOP1,
	Hero20039_Define.SkillType.SkillLLL2,
	Hero20039_Define.SkillType.SkillHP2
}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillS1] = {}
Hero20039_Config.skillComboSkill[Hero20039_Define.SkillType.SkillNS1] = {}
Hero20039_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero20039_Define.SkillType.SkillDP,
	AnimalBase_Define.SkillType.Dodge
}
Hero20039_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {
	Hero20039_Define.SkillType.SkillOP1
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.FrontFly
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.None
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.None
}
Hero20039_Config.skillHitType[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.HitType.None
}
Hero20039_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20039_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Up
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20039_Config.skillTypeForAI[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20039_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20039_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillLLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillH1] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillHPHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillLPLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillO1] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillOP1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillHHHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillSSS2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillOP21] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillOP22] = {
	XCube.ShapeType.Cube
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillDP] = {
	XCube.ShapeType.None
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None
}
Hero20039_Config.skillColliderShape[Hero20039_Define.SkillType.SkillNS1] = {
	XCube.ShapeType.None
}
Hero20039_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20039_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20039_Config.skillAttackBoxType[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20039_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20039_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillLLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillHPHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillLPLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillOP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillHHHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillSSS2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillOP21] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillOP22] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[Hero20039_Define.SkillType.SkillNS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillMultiTarget[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.None
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None
}
Hero20039_Config.skillDamageType[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.DamageType.None
}
Hero20039_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20039_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillH1] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillHPHHH1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillLPLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillO1] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillOP1] = {
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillLP2] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillHP2] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillOP21] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillOP22] = {
	true
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillBlockedEnable[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillBlockedRebound[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.hitHandEnable[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.hitHandRebound[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillH1] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillHPHHH1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillLPLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillO1] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillOP1] = {
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillLP2] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillHP2] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillOP21] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillOP22] = {
	true
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillCounterAttackedEnable[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillH1] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillHPHHH1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillLPLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillO1] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillOP1] = {
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillLP2] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillHP2] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillSSS2] = {
	true,
	false,
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillOP21] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillOP22] = {
	true
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillCounterAttackedRebound[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillH1] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillHPHHH1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillLPLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillO1] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillOP1] = {
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillLP2] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillHP2] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillOP21] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillOP22] = {
	true
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillParryEnable[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillH1] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillHPHHH1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillLPLLL1] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillO1] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillOP1] = {
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillLP2] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillHP2] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillOP21] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillOP22] = {
	true
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillParryRebound[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillH1] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillHPHHH1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillLPLLL1] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillO1] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillOP1] = {
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillLP2] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillHP2] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillOP21] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillOP22] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillDP] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillS1] = {
	false
}
Hero20039_Config.skillBeatBackEnable[Hero20039_Define.SkillType.SkillNS1] = {
	false
}
Hero20039_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20039_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillLLLL1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillH1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillHPHHH1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillLPLLL1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillO1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillOP1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillLLL2] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillLP2] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillHHHHH2] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillHP2] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillSSS2] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillOP21] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillOP22] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillDP] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillS1] = {}
Hero20039_Config.skillHitCombo[Hero20039_Define.SkillType.SkillNS1] = {}
Hero20039_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillHPHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillLPLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillOP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillOP21] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillOP22] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[Hero20039_Define.SkillType.SkillNS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20039_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillHPHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillLPLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillHHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillSSS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillOP21] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillOP22] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[Hero20039_Define.SkillType.SkillNS1] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20039_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillHPHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillLPLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillOP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillHHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillHP2] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillSSS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillOP21] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillOP22] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[Hero20039_Define.SkillType.SkillNS1] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20039_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20039_Config
