-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20037_Config.lua

Hero20037_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20037_Config.animatorLayerConfig.BaseLayer = 0
Hero20037_Config.animatorLayerConfig.UpperBody = -1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillLLL] = 3
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillHP] = 3
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillH] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillS] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillSP] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillNS] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillNSP] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillD] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillDP] = 1
Hero20037_Config.skillComboMax[Hero20037_Define.SkillType.SkillNH] = 1
Hero20037_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 1
Hero20037_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20037_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20037_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillLLL] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillHP] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillH] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillS] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillSP] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillNS] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillNSP] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillD] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillDP] = {}
Hero20037_Config.skillComboSkill[Hero20037_Define.SkillType.SkillNH] = {}
Hero20037_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20037_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20037_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20037_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.None
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20037_Config.skillHitType[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Down
}
Hero20037_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20037_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20037_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20037_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20037_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20037_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillHP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillNS] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillD] = {
	XCube.ShapeType.None
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillDP] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[Hero20037_Define.SkillType.SkillNH] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube
}
Hero20037_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20037_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20037_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20037_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20037_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20037_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillNS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[Hero20037_Define.SkillType.SkillNH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillHP] = {
	false,
	false,
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillS] = {
	false
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillMultiTarget[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.None
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20037_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20037_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20037_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillSP] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillBlockedEnable[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillSP] = {
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillNS] = {
	false
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillNSP] = {
	false
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillBlockedRebound[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillH] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillS] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillDP] = {
	false
}
Hero20037_Config.hitHandEnable[Hero20037_Define.SkillType.SkillNH] = {
	false
}
Hero20037_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillH] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillS] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillDP] = {
	false
}
Hero20037_Config.hitHandRebound[Hero20037_Define.SkillType.SkillNH] = {
	false
}
Hero20037_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillSP] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20037_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillSP] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillNS] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillNSP] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20037_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillH] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillS] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillNS] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillNSP] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillDP] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[Hero20037_Define.SkillType.SkillNH] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillSP] = {
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillNS] = {
	false
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillNSP] = {
	false
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillParryEnable[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillHP] = {
	true,
	true,
	true
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillH] = {
	true
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillS] = {
	true
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillNS] = {
	false
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillNSP] = {
	false
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillDP] = {
	true
}
Hero20037_Config.skillParryRebound[Hero20037_Define.SkillType.SkillNH] = {
	true
}
Hero20037_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillH] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillS] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillSP] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillNS] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillNSP] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillD] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillDP] = {
	false
}
Hero20037_Config.skillBeatBackEnable[Hero20037_Define.SkillType.SkillNH] = {
	false
}
Hero20037_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20037_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20037_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20037_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillLLL] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillHP] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillH] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillS] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillSP] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillNS] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillNSP] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillD] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillDP] = {}
Hero20037_Config.skillHitCombo[Hero20037_Define.SkillType.SkillNH] = {}
Hero20037_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20037_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20037_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20037_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20037_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20037_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20037_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20037_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillDP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[Hero20037_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillNSP] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[Hero20037_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20037_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillSP] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillNSP] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillDP] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[Hero20037_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20037_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20037_Config
