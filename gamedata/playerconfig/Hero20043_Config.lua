-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20043_Config.lua

Hero20043_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20043_Config.animatorLayerConfig.BaseLayer = 0
Hero20043_Config.animatorLayerConfig.UpperBody = -1
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillLLL] = 3
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillHHHH] = 4
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillLP] = 1
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillHP] = 3
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillSP] = 1
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillS] = 1
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillDP] = 1
Hero20043_Config.skillComboMax[Hero20043_Define.SkillType.SkillLPC] = 1
Hero20043_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20043_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20043_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20043_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20043_Config.skillComboSkill[Hero20043_Define.SkillType.SkillLPC] = {}
Hero20043_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20043_Define.SkillType.SkillS
}
Hero20043_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20043_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20043_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.None
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20043_Config.skillHitType[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.HitType.Down
}
Hero20043_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20043_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20043_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20043_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20043_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20043_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20043_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20043_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillHHHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillHP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillDP] = {
	XCube.ShapeType.Cube
}
Hero20043_Config.skillColliderShape[Hero20043_Define.SkillType.SkillLPC] = {
	XCube.ShapeType.Cube
}
Hero20043_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20043_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20043_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20043_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20043_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20043_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20043_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20043_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillHHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[Hero20043_Define.SkillType.SkillLPC] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillHP] = {
	false,
	true,
	false
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillMultiTarget[Hero20043_Define.SkillType.SkillLPC] = {
	true
}
Hero20043_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20043_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20043_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20043_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20043_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillSP] = {
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillS] = {
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillBlockedEnable[Hero20043_Define.SkillType.SkillLPC] = {
	true
}
Hero20043_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillSP] = {
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillS] = {
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillBlockedRebound[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillLP] = {
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillDP] = {
	false
}
Hero20043_Config.hitHandEnable[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillLP] = {
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillDP] = {
	false
}
Hero20043_Config.hitHandRebound[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillSP] = {
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillS] = {
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillCounterAttackedEnable[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillCounterAttackedRebound[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillLP] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillDP] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillSP] = {
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillS] = {
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillParryEnable[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillHHHH] = {
	true,
	true,
	true,
	true
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillLP] = {
	true
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillDP] = {
	true
}
Hero20043_Config.skillParryRebound[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillHHHH] = {
	false,
	false,
	false,
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillLP] = {
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillSP] = {
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillS] = {
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillDP] = {
	false
}
Hero20043_Config.skillBeatBackEnable[Hero20043_Define.SkillType.SkillLPC] = {
	false
}
Hero20043_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20043_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20043_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20043_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillLLL] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillHHHH] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillLP] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillHP] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillSP] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillS] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillDP] = {}
Hero20043_Config.skillHitCombo[Hero20043_Define.SkillType.SkillLPC] = {}
Hero20043_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20043_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20043_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20043_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20043_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20043_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20043_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20043_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillHHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20043_Config.skillRotationTypeAI[Hero20043_Define.SkillType.SkillLPC] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20043_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[Hero20043_Define.SkillType.SkillLPC] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20043_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillHHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[Hero20043_Define.SkillType.SkillLPC] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20043_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20043_Config
