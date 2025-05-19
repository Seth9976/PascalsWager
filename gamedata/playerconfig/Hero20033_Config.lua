-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20033_Config.lua

Hero20033_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20033_Config.animatorLayerConfig.BaseLayer = 0
Hero20033_Config.animatorLayerConfig.UpperBody = -1
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillH] = 1
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillLP] = 3
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillDP] = 3
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillD] = 1
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillDefence] = 4
Hero20033_Config.skillComboMax[Hero20033_Define.SkillType.SkillOO] = 2
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20033_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillH] = {}
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillLP] = {}
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillDP] = {}
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillD] = {}
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillDefence] = {}
Hero20033_Config.skillComboSkill[Hero20033_Define.SkillType.SkillOO] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20033_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Down
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20033_Config.skillHitType[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20033_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20033_Config.skillTypeForAI[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillDP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillD] = {
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20033_Config.skillColliderShape[Hero20033_Define.SkillType.SkillOO] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20033_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillAttackBoxType[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[Hero20033_Define.SkillType.SkillOO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillD] = {
	true
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillMultiTarget[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20033_Config.skillDamageType[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20033_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillDP] = {
	false,
	true,
	true
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillD] = {
	true
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillBlockedEnable[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillH] = {
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillBlockedRebound[Hero20033_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillH] = {
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.hitHandEnable[Hero20033_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillH] = {
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.hitHandRebound[Hero20033_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillD] = {
	true
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillCounterAttackedEnable[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillD] = {
	true
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillCounterAttackedRebound[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillH] = {
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[Hero20033_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillParryEnable[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillH] = {
	true
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillParryRebound[Hero20033_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillH] = {
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillD] = {
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[Hero20033_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20033_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillH] = {}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillLP] = {}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillDP] = {}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillD] = {}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillDefence] = {}
Hero20033_Config.skillHitCombo[Hero20033_Define.SkillType.SkillOO] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20033_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillH] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillLP] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillDP] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillD] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillDefence] = {}
Hero20033_Config.skillHitComboAI[Hero20033_Define.SkillType.SkillOO] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20033_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[Hero20033_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[Hero20033_Define.SkillType.SkillOO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[Hero20033_Define.SkillType.SkillOO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20033_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20033_Config
