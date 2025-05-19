-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20032_Config.lua

Hero20032_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20032_Config.animatorLayerConfig.BaseLayer = 0
Hero20032_Config.animatorLayerConfig.UpperBody = -1
Hero20032_Config.skillComboMax[Hero20032_Define.SkillType.SkillLM] = 5
Hero20032_Config.skillComboMax[Hero20032_Define.SkillType.SkillHHH] = 3
Hero20032_Config.skillComboMax[Hero20032_Define.SkillType.SkillDP] = 3
Hero20032_Config.skillComboMax[Hero20032_Define.SkillType.SkillD] = 1
Hero20032_Config.skillComboMax[Hero20032_Define.SkillType.SkillDefence] = 4
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20032_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20032_Config.skillComboSkill[Hero20032_Define.SkillType.SkillLM] = {}
Hero20032_Config.skillComboSkill[Hero20032_Define.SkillType.SkillHHH] = {}
Hero20032_Config.skillComboSkill[Hero20032_Define.SkillType.SkillDP] = {}
Hero20032_Config.skillComboSkill[Hero20032_Define.SkillType.SkillD] = {}
Hero20032_Config.skillComboSkill[Hero20032_Define.SkillType.SkillDefence] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20032_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20032_Config.skillNextType[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20032_Config.skillMoveTypeList[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20032_Config.skillHitType[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Down
}
Hero20032_Config.skillHitType[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20032_Config.skillHitType[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20032_Config.skillHitType[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20032_Config.skillHitType[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20032_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20032_Config.skillTypeForAI[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20032_Config.skillTypeForAI[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20032_Config.skillTypeForAI[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20032_Config.skillTypeForAI[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20032_Config.skillTypeForAI[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20032_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20032_Config.skillColliderShape[Hero20032_Define.SkillType.SkillLM] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20032_Config.skillColliderShape[Hero20032_Define.SkillType.SkillHHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20032_Config.skillColliderShape[Hero20032_Define.SkillType.SkillDP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20032_Config.skillColliderShape[Hero20032_Define.SkillType.SkillD] = {
	XCube.ShapeType.Cube
}
Hero20032_Config.skillColliderShape[Hero20032_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20032_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20032_Config.skillAttackBoxType[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20032_Config.skillAttackBoxType[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20032_Config.skillAttackBoxType[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20032_Config.skillAttackBoxType[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20032_Config.skillAttackBoxType[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20032_Config.skillTargetType[Hero20032_Define.SkillType.SkillLM] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[Hero20032_Define.SkillType.SkillHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[Hero20032_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[Hero20032_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[Hero20032_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20032_Config.skillMultiTarget[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillMultiTarget[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillMultiTarget[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	true
}
Hero20032_Config.skillMultiTarget[Hero20032_Define.SkillType.SkillD] = {
	true
}
Hero20032_Config.skillMultiTarget[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillDamageType[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20032_Config.skillDamageType[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20032_Config.skillDamageType[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20032_Config.skillDamageType[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20032_Config.skillDamageType[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20032_Config.skillBlockedEnable[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillBlockedEnable[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillBlockedEnable[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.skillBlockedEnable[Hero20032_Define.SkillType.SkillD] = {
	true
}
Hero20032_Config.skillBlockedEnable[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillBlockedRebound[Hero20032_Define.SkillType.SkillLM] = {
	false,
	false,
	false,
	false,
	false
}
Hero20032_Config.skillBlockedRebound[Hero20032_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20032_Config.skillBlockedRebound[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.skillBlockedRebound[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.skillBlockedRebound[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.hitHandEnable[Hero20032_Define.SkillType.SkillLM] = {
	false,
	false,
	false,
	false,
	false
}
Hero20032_Config.hitHandEnable[Hero20032_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20032_Config.hitHandEnable[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.hitHandEnable[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.hitHandEnable[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.hitHandRebound[Hero20032_Define.SkillType.SkillLM] = {
	false,
	false,
	false,
	false,
	false
}
Hero20032_Config.hitHandRebound[Hero20032_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20032_Config.hitHandRebound[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.hitHandRebound[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.hitHandRebound[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedEnable[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillCounterAttackedEnable[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillCounterAttackedEnable[Hero20032_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20032_Config.skillCounterAttackedEnable[Hero20032_Define.SkillType.SkillD] = {
	true
}
Hero20032_Config.skillCounterAttackedEnable[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedRebound[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillCounterAttackedRebound[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillCounterAttackedRebound[Hero20032_Define.SkillType.SkillDP] = {
	true,
	true,
	false
}
Hero20032_Config.skillCounterAttackedRebound[Hero20032_Define.SkillType.SkillD] = {
	true
}
Hero20032_Config.skillCounterAttackedRebound[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[Hero20032_Define.SkillType.SkillLM] = {
	false,
	false,
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[Hero20032_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.skillCounterAttackedKeep[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillParryEnable[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillParryEnable[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillParryEnable[Hero20032_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20032_Config.skillParryEnable[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.skillParryEnable[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillParryRebound[Hero20032_Define.SkillType.SkillLM] = {
	true,
	true,
	true,
	true,
	true
}
Hero20032_Config.skillParryRebound[Hero20032_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20032_Config.skillParryRebound[Hero20032_Define.SkillType.SkillDP] = {
	true,
	true,
	true
}
Hero20032_Config.skillParryRebound[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.skillParryRebound[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[Hero20032_Define.SkillType.SkillLM] = {
	false,
	false,
	false,
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[Hero20032_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[Hero20032_Define.SkillType.SkillDP] = {
	false,
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[Hero20032_Define.SkillType.SkillD] = {
	false
}
Hero20032_Config.skillBeatBackEnable[Hero20032_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20032_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20032_Config.skillHitCombo[Hero20032_Define.SkillType.SkillLM] = {}
Hero20032_Config.skillHitCombo[Hero20032_Define.SkillType.SkillHHH] = {}
Hero20032_Config.skillHitCombo[Hero20032_Define.SkillType.SkillDP] = {}
Hero20032_Config.skillHitCombo[Hero20032_Define.SkillType.SkillD] = {}
Hero20032_Config.skillHitCombo[Hero20032_Define.SkillType.SkillDefence] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20032_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20032_Config.skillHitComboAI[Hero20032_Define.SkillType.SkillLM] = {}
Hero20032_Config.skillHitComboAI[Hero20032_Define.SkillType.SkillHHH] = {}
Hero20032_Config.skillHitComboAI[Hero20032_Define.SkillType.SkillDP] = {}
Hero20032_Config.skillHitComboAI[Hero20032_Define.SkillType.SkillD] = {}
Hero20032_Config.skillHitComboAI[Hero20032_Define.SkillType.SkillDefence] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20032_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20032_Config.skillRotationTypeAI[Hero20032_Define.SkillType.SkillLM] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[Hero20032_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[Hero20032_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[Hero20032_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[Hero20032_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20032_Config.skillLayer[Hero20032_Define.SkillType.SkillLM] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[Hero20032_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[Hero20032_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[Hero20032_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20032_Config.skillLayer[Hero20032_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[Hero20032_Define.SkillType.SkillLM] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[Hero20032_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[Hero20032_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[Hero20032_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[Hero20032_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20032_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20032_Config
