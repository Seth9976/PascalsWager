-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20020_Config.lua

Hero20020_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20020_Config.animatorLayerConfig.BaseLayer = 0
Hero20020_Config.animatorLayerConfig.UpperBody = -1
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillLP] = 1
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillLLL] = 3
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillDefence] = 4
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillNSP] = 3
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillHP] = 1
Hero20020_Config.skillComboMax[Hero20020_Define.SkillType.SkillH] = 1
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20020_Config.skillComboMax[AnimalBase_Define.SkillType.Born3] = 2
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillLP] = {}
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillLLL] = {
	Hero20020_Define.SkillType.SkillLP,
	Hero20020_Define.SkillType.SkillHP
}
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillDefence] = {
	Hero20020_Define.SkillType.SkillH
}
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillNSP] = {}
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillHP] = {}
Hero20020_Config.skillComboSkill[Hero20020_Define.SkillType.SkillH] = {
	Hero20020_Define.SkillType.SkillHP
}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20020_Config.skillComboSkill[AnimalBase_Define.SkillType.Born3] = {}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.Skill
}
Hero20020_Config.skillNextType[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillNextType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light
}
Hero20020_Config.skillHitType[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillHitType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20020_Config.skillTypeForAI[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20020_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20020_Config.skillColliderShape[Hero20020_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20020_Config.skillColliderShape[AnimalBase_Define.SkillType.Born3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20020_Config.skillAttackBoxType[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[Hero20020_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillTargetType[AnimalBase_Define.SkillType.Born3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillMultiTarget[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20020_Config.skillDamageType[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillDamageType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillBlockedEnable[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillBlockedRebound[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillLP] = {
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillHP] = {
	false
}
Hero20020_Config.hitHandEnable[Hero20020_Define.SkillType.SkillH] = {
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.hitHandEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillLP] = {
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillHP] = {
	false
}
Hero20020_Config.hitHandRebound[Hero20020_Define.SkillType.SkillH] = {
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.hitHandRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillCounterAttackedEnable[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillCounterAttackedRebound[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillLP] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillHP] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[Hero20020_Define.SkillType.SkillH] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillParryEnable[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillParryEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillLP] = {
	true
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillHP] = {
	true
}
Hero20020_Config.skillParryRebound[Hero20020_Define.SkillType.SkillH] = {
	true
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillParryRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillLP] = {
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillHP] = {
	false
}
Hero20020_Config.skillBeatBackEnable[Hero20020_Define.SkillType.SkillH] = {
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20020_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillLP] = {}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillLLL] = {}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillDefence] = {}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillNSP] = {}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillHP] = {}
Hero20020_Config.skillHitCombo[Hero20020_Define.SkillType.SkillH] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20020_Config.skillHitCombo[AnimalBase_Define.SkillType.Born3] = {}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20020_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born3] = {}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[Hero20020_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[Hero20020_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[Hero20020_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20020_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20020_Config
