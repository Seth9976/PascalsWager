-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20028_Config.lua

Hero20028_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20028_Config.animatorLayerConfig.BaseLayer = 0
Hero20028_Config.animatorLayerConfig.UpperBody = -1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillLLLL] = 5
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillLPLL] = 4
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillHHHH] = 5
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillHP] = 2
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillHPH] = 1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillHPL] = 1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillHPS] = 1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillSSS] = 4
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillSP] = 3
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillOP] = 1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillO] = 1
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillD] = 2
Hero20028_Config.skillComboMax[Hero20028_Define.SkillType.SkillDP] = 1
Hero20028_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20028_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20028_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20028_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillLLLL] = {
	Hero20028_Define.SkillType.SkillD
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillLPLL] = {
	Hero20028_Define.SkillType.SkillD
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillHHHH] = {
	Hero20028_Define.SkillType.SkillD
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillHP] = {
	Hero20028_Define.SkillType.SkillHPH,
	Hero20028_Define.SkillType.SkillHPL,
	Hero20028_Define.SkillType.SkillHPS
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillHPH] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillHPL] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillHPS] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillSSS] = {
	Hero20028_Define.SkillType.SkillD
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillSP] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillOP] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillO] = {}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillD] = {
	Hero20028_Define.SkillType.SkillDP
}
Hero20028_Config.skillComboSkill[Hero20028_Define.SkillType.SkillDP] = {}
Hero20028_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20028_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20028_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20028_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.HitType.Up
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.None
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitType[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.StatusWeak
}
Hero20028_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.Light
}
Hero20028_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20028_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20028_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20028_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20028_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20028_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillLLLL] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillLPLL] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillHHHH] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillHP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillHPH] = {
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillHPL] = {
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillHPS] = {
	XCube.ShapeType.Capsule
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillSSS] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillOP] = {
	XCube.ShapeType.Capsule
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillO] = {
	XCube.ShapeType.Point
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillD] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[Hero20028_Define.SkillType.SkillDP] = {
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20028_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20028_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20028_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20028_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20028_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20028_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillLLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillLPLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillHHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillHPH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillHPL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillHPS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillSSS] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[Hero20028_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillHP] = {
	false,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillHPH] = {
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillHPL] = {
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillHPS] = {
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillSP] = {
	false,
	true,
	false
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillOP] = {
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillD] = {
	false,
	true
}
Hero20028_Config.skillMultiTarget[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillHP] = {
	false,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillHPH] = {
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillHPL] = {
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillSSS] = {
	true,
	true,
	true,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillO] = {
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillD] = {
	false,
	true
}
Hero20028_Config.skillBlockedEnable[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.skillBlockedRebound[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.hitHandEnable[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.hitHandRebound[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillHP] = {
	false,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillHPH] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillHPL] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillHPS] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillSP] = {
	false,
	true,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillOP] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillO] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillD] = {
	false,
	true
}
Hero20028_Config.skillCounterAttackedEnable[Hero20028_Define.SkillType.SkillDP] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	true
}
Hero20028_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillSSS] = {
	true,
	true,
	true,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillSP] = {
	false,
	true,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillD] = {
	false,
	true
}
Hero20028_Config.skillCounterAttackedRebound[Hero20028_Define.SkillType.SkillDP] = {
	true
}
Hero20028_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	true
}
Hero20028_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.skillCounterAttackedKeep[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillHPH] = {
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillHPL] = {
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillHPS] = {
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillO] = {
	true
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.skillParryEnable[Hero20028_Define.SkillType.SkillDP] = {
	true
}
Hero20028_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	true,
	true,
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	true,
	true,
	true,
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillHPH] = {
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillHPL] = {
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillHPS] = {
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillO] = {
	true
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.skillParryRebound[Hero20028_Define.SkillType.SkillDP] = {
	true
}
Hero20028_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillHPH] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillHPL] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillHPS] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillSSS] = {
	false,
	false,
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillOP] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillO] = {
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillD] = {
	false,
	false
}
Hero20028_Config.skillBeatBackEnable[Hero20028_Define.SkillType.SkillDP] = {
	false
}
Hero20028_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20028_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20028_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20028_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillLLLL] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillLPLL] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillHHHH] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillHP] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillHPH] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillHPL] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillHPS] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillSSS] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillSP] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillOP] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillO] = {}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitCombo[Hero20028_Define.SkillType.SkillDP] = {}
Hero20028_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20028_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20028_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20028_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20028_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20028_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20028_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20028_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillHPS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillSSS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[Hero20028_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillLPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillHPH] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillHPL] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillHPS] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillSSS] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillOP] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillD] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillLayer[Hero20028_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20028_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillLPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillHPH] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillHPL] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillHPS] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillSSS] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillOP] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillD] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[Hero20028_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20028_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20028_Config
