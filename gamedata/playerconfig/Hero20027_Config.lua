-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20027_Config.lua

Hero20027_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20027_Config.animatorLayerConfig.BaseLayer = 0
Hero20027_Config.animatorLayerConfig.UpperBody = -1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillHP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillLP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNLP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillL] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNL] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNHP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillSP] = 3
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillS] = 2
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillH] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNSP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillOP] = 3
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNOP] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillO] = 1
Hero20027_Config.skillComboMax[Hero20027_Define.SkillType.SkillNO] = 2
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillHP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillLP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNLP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillL] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNL] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNHP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillSP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillS] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillH] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNSP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillOP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNOP] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillO] = {}
Hero20027_Config.skillComboSkill[Hero20027_Define.SkillType.SkillNO] = {}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillNextType[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillMoveTypeList[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillRecoveryMoveTypeList[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Down
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.HitType.Down
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.FrontFly
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Heavy
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.None
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Light
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20027_Config.skillHitType[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Up
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20027_Config.skillTypeForAI[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNLP] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNHP] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillH] = {
	XCube.ShapeType.None
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.Cube
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillOP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNOP] = {
	XCube.ShapeType.Point
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillO] = {
	XCube.ShapeType.Point
}
Hero20027_Config.skillColliderShape[Hero20027_Define.SkillType.SkillNO] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20027_Config.skillAttackBoxType[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.None
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNOP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillTargetType[Hero20027_Define.SkillType.SkillNO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillHP] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillLP] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNLP] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillL] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNL] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNHP] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNOP] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillO] = {
	true
}
Hero20027_Config.skillMultiTarget[Hero20027_Define.SkillType.SkillNO] = {
	true,
	true
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.None
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillDamageType[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillBlockedEnable[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillBlockedRebound[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.hitHandEnable[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.hitHandRebound[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillCounterAttackedEnable[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillCounterAttackedRebound[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillCounterAttackedKeep[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillParryEnable[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillParryRebound[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillHP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillLP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNLP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillL] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNL] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNHP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillH] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNSP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillOP] = {
	false,
	false,
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNOP] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillO] = {
	false
}
Hero20027_Config.skillBeatBackEnable[Hero20027_Define.SkillType.SkillNO] = {
	false,
	false
}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillHP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillLP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNLP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillL] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNL] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNHP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillSP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillS] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillH] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNSP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillOP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNOP] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillO] = {}
Hero20027_Config.skillHitCombo[Hero20027_Define.SkillType.SkillNO] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillHP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillLP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNLP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillL] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNL] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNHP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillSP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillS] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillH] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNSP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillOP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNOP] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillO] = {}
Hero20027_Config.skillHitComboAI[Hero20027_Define.SkillType.SkillNO] = {}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillRotationTypeAI[Hero20027_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNLP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNSP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNOP] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20027_Config.skillLayer[Hero20027_Define.SkillType.SkillNO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNLP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNSP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNOP] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20027_Config.skillRecoveryLayer[Hero20027_Define.SkillType.SkillNO] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20027_Config
