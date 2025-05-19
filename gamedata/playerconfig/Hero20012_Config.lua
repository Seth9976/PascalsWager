-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20012_Config.lua

Hero20012_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20012_Config.animatorLayerConfig.BaseLayer = 0
Hero20012_Config.animatorLayerConfig.UpperBody = -1
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillL] = 1
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillNL] = 1
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillSP] = 3
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillS] = 1
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillHHHHH] = 5
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillNH] = 1
Hero20012_Config.skillComboMax[Hero20012_Define.SkillType.SkillSPC] = 3
Hero20012_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20012_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20012_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillL] = {
	Hero20012_Define.SkillType.SkillNL
}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillNL] = {
	Hero20012_Define.SkillType.SkillSP,
	Hero20012_Define.SkillType.SkillS
}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillSP] = {
	Hero20012_Define.SkillType.SkillNL
}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillS] = {}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillHHHHH] = {}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillNH] = {
	Hero20012_Define.SkillType.SkillNL,
	Hero20012_Define.SkillType.SkillHHHHH,
	Hero20012_Define.SkillType.SkillL
}
Hero20012_Config.skillComboSkill[Hero20012_Define.SkillType.SkillSPC] = {}
Hero20012_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20012_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20012_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Down
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20012_Config.skillHitType[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20012_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20012_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20012_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20012_Config.skillTypeForAI[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20012_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20012_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20012_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillHHHHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillNH] = {
	XCube.ShapeType.Point
}
Hero20012_Config.skillColliderShape[Hero20012_Define.SkillType.SkillSPC] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20012_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20012_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20012_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20012_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20012_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20012_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillHHHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillNH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[Hero20012_Define.SkillType.SkillSPC] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20012_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillL] = {
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillNL] = {
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillHHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillMultiTarget[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20012_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20012_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20012_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillS] = {
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillNH] = {
	true
}
Hero20012_Config.skillBlockedEnable[Hero20012_Define.SkillType.SkillSPC] = {
	true,
	true,
	true
}
Hero20012_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillS] = {
	true
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillBlockedRebound[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillL] = {
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillNL] = {
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillHHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.hitHandEnable[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillL] = {
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillNL] = {
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillHHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.hitHandRebound[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillS] = {
	true
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillCounterAttackedEnable[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillS] = {
	true
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillCounterAttackedRebound[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillL] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillNL] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillHHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillParryEnable[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillL] = {
	true
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillNL] = {
	true
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillHHHHH] = {
	true,
	true,
	true,
	true,
	true
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillParryRebound[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillL] = {
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillNL] = {
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillS] = {
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillHHHHH] = {
	false,
	false,
	false,
	false,
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillNH] = {
	false
}
Hero20012_Config.skillBeatBackEnable[Hero20012_Define.SkillType.SkillSPC] = {
	false,
	false,
	false
}
Hero20012_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20012_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20012_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillL] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillNL] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillSP] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillS] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillHHHHH] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillNH] = {}
Hero20012_Config.skillHitCombo[Hero20012_Define.SkillType.SkillSPC] = {}
Hero20012_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20012_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20012_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillL] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillNL] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillSP] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillS] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillHHHHH] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillNH] = {}
Hero20012_Config.skillHitComboAI[Hero20012_Define.SkillType.SkillSPC] = {}
Hero20012_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20012_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20012_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillHHHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[Hero20012_Define.SkillType.SkillSPC] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillHHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[Hero20012_Define.SkillType.SkillSPC] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20012_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillHHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[Hero20012_Define.SkillType.SkillSPC] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20012_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20012_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Super
Hero20012_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Super
Hero20012_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Super

return Hero20012_Config
