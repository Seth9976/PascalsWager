-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20041_Config.lua

Hero20041_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20041_Config.animatorLayerConfig.BaseLayer = 0
Hero20041_Config.animatorLayerConfig.UpperBody = -1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillLL] = 2
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillLP] = 1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillHP] = 1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillH] = 1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillS] = 1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillSP] = 3
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillDead] = 1
Hero20041_Config.skillComboMax[Hero20041_Define.SkillType.SkillO] = 1
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20041_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillLL] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillLP] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillHP] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillH] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillS] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillSP] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillDead] = {}
Hero20041_Config.skillComboSkill[Hero20041_Define.SkillType.SkillO] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20041_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Dizzy,
	AnimalBase_Define.HitType.LightDizzy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20041_Config.skillHitType[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.FrontFly
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20041_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillDead] = {
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[Hero20041_Define.SkillType.SkillO] = {
	XCube.ShapeType.None
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20041_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillDead] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[Hero20041_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillS] = {
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillDead] = {
	true
}
Hero20041_Config.skillMultiTarget[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	true
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillS] = {
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillDead] = {
	true
}
Hero20041_Config.skillBlockedEnable[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	true
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillS] = {
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillDead] = {
	true
}
Hero20041_Config.skillBlockedRebound[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	true
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillLP] = {
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillHP] = {
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillH] = {
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillDead] = {
	true
}
Hero20041_Config.hitHandEnable[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillLP] = {
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillHP] = {
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillH] = {
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.hitHandRebound[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillS] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillSP] = {
	true,
	false,
	false
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillDead] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[Hero20041_Define.SkillType.SkillO] = {
	true
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	true
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillS] = {
	true
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillSP] = {
	true,
	false,
	false
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.skillCounterAttackedRebound[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillLP] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillHP] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillH] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillSP] = {
	true,
	false,
	false
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.skillParryEnable[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillLP] = {
	true
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillHP] = {
	true
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillH] = {
	true
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillSP] = {
	true,
	false,
	false
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.skillParryRebound[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillLP] = {
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillHP] = {
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillH] = {
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillS] = {
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillDead] = {
	false
}
Hero20041_Config.skillBeatBackEnable[Hero20041_Define.SkillType.SkillO] = {
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20041_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20041_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillLL] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillLP] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillHP] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillH] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillS] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillSP] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillDead] = {}
Hero20041_Config.skillHitComboAI[Hero20041_Define.SkillType.SkillO] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20041_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillDead] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[Hero20041_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillDead] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[Hero20041_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillDead] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[Hero20041_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20041_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20041_Config
