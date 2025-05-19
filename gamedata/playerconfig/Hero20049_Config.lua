-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20049_Config.lua

Hero20049_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20049_Config.animatorLayerConfig.BaseLayer = 0
Hero20049_Config.animatorLayerConfig.UpperBody = -1
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillLLL] = 3
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillHHH] = 3
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillLP] = 1
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillO] = 1
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillS] = 1
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillSP] = 1
Hero20049_Config.skillComboMax[Hero20049_Define.SkillType.SkillDP] = 5
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20049_Config.skillComboMax[AnimalBase_Define.SkillType.Born3] = 2
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillLLL] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillHHH] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillLP] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillO] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillS] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillSP] = {}
Hero20049_Config.skillComboSkill[Hero20049_Define.SkillType.SkillDP] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20049_Config.skillComboSkill[AnimalBase_Define.SkillType.Born3] = {}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillNextType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitType[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.LightFreeze,
	AnimalBase_Define.HitType.PullFrontFreeze,
	AnimalBase_Define.HitType.FrontFly
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillHitType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20049_Config.skillTypeForAI[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Pull,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20049_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillHHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillO] = {
	XCube.ShapeType.Cube
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point
}
Hero20049_Config.skillColliderShape[Hero20049_Define.SkillType.SkillDP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20049_Config.skillColliderShape[AnimalBase_Define.SkillType.Born3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20049_Config.skillAttackBoxType[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Self
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[Hero20049_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillTargetType[AnimalBase_Define.SkillType.Born3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillMultiTarget[Hero20049_Define.SkillType.SkillDP] = {
	false,
	false,
	false,
	false,
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Period
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillDamageType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillBlockedEnable[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillLP] = {
	false
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillBlockedRebound[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillLP] = {
	false
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.hitHandEnable[Hero20049_Define.SkillType.SkillDP] = {
	false,
	false,
	false,
	false,
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.hitHandEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillLP] = {
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillS] = {
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillSP] = {
	false
}
Hero20049_Config.hitHandRebound[Hero20049_Define.SkillType.SkillDP] = {
	false,
	false,
	false,
	false,
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.hitHandRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillCounterAttackedEnable[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillCounterAttackedRebound[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillLP] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillS] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillSP] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[Hero20049_Define.SkillType.SkillDP] = {
	false,
	false,
	false,
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillParryEnable[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillParryEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillParryRebound[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillParryRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillLP] = {
	true
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillO] = {
	false
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillS] = {
	true
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillSP] = {
	true
}
Hero20049_Config.skillBeatBackEnable[Hero20049_Define.SkillType.SkillDP] = {
	true,
	true,
	true,
	true,
	true
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20049_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillLLL] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillHHH] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillLP] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillO] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillS] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillSP] = {}
Hero20049_Config.skillHitCombo[Hero20049_Define.SkillType.SkillDP] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20049_Config.skillHitCombo[AnimalBase_Define.SkillType.Born3] = {}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20049_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born3] = {}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[Hero20049_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[Hero20049_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[Hero20049_Define.SkillType.SkillDP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20049_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20049_Config
