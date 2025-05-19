-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20048_Config.lua

Hero20048_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20048_Config.animatorLayerConfig.BaseLayer = 0
Hero20048_Config.animatorLayerConfig.UpperBody = -1
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillLLL] = 3
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillHP] = 3
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillSP] = 1
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillS] = 1
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillNS] = 1
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillNSP] = 2
Hero20048_Config.skillComboMax[Hero20048_Define.SkillType.SkillNL] = 1
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20048_Config.skillComboMax[AnimalBase_Define.SkillType.Born3] = 2
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20048_Define.SkillType.SkillNL
}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillNSP] = {}
Hero20048_Config.skillComboSkill[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20048_Define.SkillType.SkillS,
	Hero20048_Define.SkillType.SkillSP
}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {
	Hero20048_Define.SkillType.SkillNSP
}
Hero20048_Config.skillComboSkill[AnimalBase_Define.SkillType.Born3] = {}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillNextType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillHitType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillHP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillNS] = {
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20048_Config.skillColliderShape[Hero20048_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20048_Config.skillColliderShape[AnimalBase_Define.SkillType.Born3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillNS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[Hero20048_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillTargetType[AnimalBase_Define.SkillType.Born3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillHP] = {
	false,
	true,
	true
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillMultiTarget[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillDamageType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillBlockedEnable[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	true
}
Hero20048_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillS] = {
	false
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillNS] = {
	false
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillBlockedRebound[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillS] = {
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillNS] = {
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.hitHandEnable[Hero20048_Define.SkillType.SkillNL] = {
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	true
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.hitHandEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillS] = {
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillNS] = {
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.hitHandRebound[Hero20048_Define.SkillType.SkillNL] = {
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.hitHandRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedEnable[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedRebound[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillSP] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillS] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillNS] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[Hero20048_Define.SkillType.SkillNL] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillParryEnable[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillParryEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillParryRebound[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillParryRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillSP] = {
	true
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillS] = {
	true
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillNS] = {
	true
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillNSP] = {
	false,
	false
}
Hero20048_Config.skillBeatBackEnable[Hero20048_Define.SkillType.SkillNL] = {
	true
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20048_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillLLL] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillHP] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillSP] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillS] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillNS] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillNSP] = {}
Hero20048_Config.skillHitCombo[Hero20048_Define.SkillType.SkillNL] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20048_Config.skillHitCombo[AnimalBase_Define.SkillType.Born3] = {}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillNSP] = {}
Hero20048_Config.skillHitComboAI[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20048_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born3] = {}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[Hero20048_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillLayer[Hero20048_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[Hero20048_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20048_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20048_Config
