-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20051_Config.lua

Hero20051_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20051_Config.animatorLayerConfig.BaseLayer = 0
Hero20051_Config.animatorLayerConfig.UpperBody = -1
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillLLL] = 3
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillHPH] = 3
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillLPLLL] = 5
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillO] = 2
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillH] = 1
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillND1] = 2
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillND2] = 3
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillS] = 1
Hero20051_Config.skillComboMax[Hero20051_Define.SkillType.SkillSP] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20051_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillLLL] = {
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	AnimalBase_Define.SkillType.Dodge,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillHPH] = {
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	AnimalBase_Define.SkillType.Dodge,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillLPLLL] = {
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	AnimalBase_Define.SkillType.Dodge,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillO] = {
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillH,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillH] = {
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	AnimalBase_Define.SkillType.Dodge,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillND1] = {
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillO,
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillND2] = {
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillO,
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2
}
Hero20051_Config.skillComboSkill[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillType.Drop
}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillO,
	Hero20051_Define.SkillType.SkillH,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillO,
	Hero20051_Define.SkillType.SkillH,
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {
	Hero20051_Define.SkillType.SkillLLL,
	Hero20051_Define.SkillType.SkillHPH,
	Hero20051_Define.SkillType.SkillLPLLL,
	Hero20051_Define.SkillType.SkillO,
	Hero20051_Define.SkillType.SkillH,
	Hero20051_Define.SkillType.SkillND1,
	Hero20051_Define.SkillType.SkillND2,
	Hero20051_Define.SkillType.SkillS
}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20051_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20051_Config.skillHitType[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20051_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.Defence
}
Hero20051_Config.skillTypeForAI[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20051_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillHPH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillLPLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillO] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillND1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillND2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillS] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[Hero20051_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20051_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20051_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillHPH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillLPLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillND1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillND2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[Hero20051_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillHPH] = {
	false,
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillLPLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillH] = {
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillND1] = {
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillND2] = {
	false,
	false,
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillMultiTarget[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20051_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillBlockedEnable[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillBlockedRebound[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillHPH] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	true
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillH] = {
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillND1] = {
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillND2] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.hitHandEnable[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillHPH] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	true
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillH] = {
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillND1] = {
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillND2] = {
	false,
	false,
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.hitHandRebound[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	false
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	false
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillHPH] = {
	false,
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillLPLLL] = {
	false,
	false,
	false,
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillH] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillND1] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillND2] = {
	false,
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	false,
	false,
	false,
	false
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillParryEnable[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	false,
	false,
	false,
	false
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillParryRebound[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillHPH] = {
	true,
	true,
	false
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillLPLLL] = {
	true,
	true,
	true,
	true,
	false
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillH] = {
	true
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillND1] = {
	true,
	true
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillND2] = {
	true,
	true,
	true
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillS] = {
	false
}
Hero20051_Config.skillBeatBackEnable[Hero20051_Define.SkillType.SkillSP] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20051_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillLLL] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillHPH] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillLPLLL] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillO] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillH] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillND1] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillND2] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillS] = {}
Hero20051_Config.skillHitCombo[Hero20051_Define.SkillType.SkillSP] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20051_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20051_Config.skillHitComboAI[Hero20051_Define.SkillType.SkillSP] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20051_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillLPLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillND2] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[Hero20051_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillHPH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillLPLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillND1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillND2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[Hero20051_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillHPH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillLPLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillND1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillND2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[Hero20051_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20051_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20051_Config
