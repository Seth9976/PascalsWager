-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20002_Config.lua

Hero20002_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20002_Config.animatorLayerConfig.BaseLayer = 0
Hero20002_Config.animatorLayerConfig.UpperBody = -1
Hero20002_Config.skillComboMax[Hero20002_Define.SkillType.SkillAimShoot] = 3
Hero20002_Config.skillComboMax[Hero20002_Define.SkillType.SkillShoot] = 2
Hero20002_Config.skillComboMax[Hero20002_Define.SkillType.SkillLLL] = 3
Hero20002_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20002_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20002_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20002_Config.skillComboSkill[Hero20002_Define.SkillType.SkillAimShoot] = {}
Hero20002_Config.skillComboSkill[Hero20002_Define.SkillType.SkillShoot] = {}
Hero20002_Config.skillComboSkill[Hero20002_Define.SkillType.SkillLLL] = {}
Hero20002_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20002_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20002_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {
	Hero20002_Define.SkillType.SkillAimShoot,
	Hero20002_Define.SkillType.SkillShoot,
	Hero20002_Define.SkillType.SkillLLL,
	AnimalBase_Define.SkillType.Alert
}
Hero20002_Config.skillNextType[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20002_Config.skillNextType[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20002_Config.skillNextType[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20002_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20002_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20002_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20002_Config.skillMoveTypeList[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillMoveTypeList[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillMoveTypeList[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20002_Config.skillHitType[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20002_Config.skillHitType[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20002_Config.skillHitType[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20002_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20002_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20002_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20002_Config.skillTypeForAI[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20002_Config.skillTypeForAI[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20002_Config.skillTypeForAI[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20002_Config.skillColliderShape[Hero20002_Define.SkillType.SkillAimShoot] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20002_Config.skillColliderShape[Hero20002_Define.SkillType.SkillShoot] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20002_Config.skillColliderShape[Hero20002_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20002_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20002_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20002_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20002_Config.skillAttackBoxType[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20002_Config.skillAttackBoxType[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20002_Config.skillAttackBoxType[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20002_Config.skillTargetType[Hero20002_Define.SkillType.SkillAimShoot] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20002_Config.skillTargetType[Hero20002_Define.SkillType.SkillShoot] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20002_Config.skillTargetType[Hero20002_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20002_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20002_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20002_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20002_Config.skillMultiTarget[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillMultiTarget[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillMultiTarget[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillDamageType[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20002_Config.skillDamageType[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20002_Config.skillDamageType[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20002_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20002_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20002_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20002_Config.skillBlockedEnable[Hero20002_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20002_Config.skillBlockedEnable[Hero20002_Define.SkillType.SkillShoot] = {
	true,
	true
}
Hero20002_Config.skillBlockedEnable[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillBlockedRebound[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillBlockedRebound[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillBlockedRebound[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.hitHandEnable[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.hitHandEnable[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.hitHandEnable[Hero20002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20002_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.hitHandRebound[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.hitHandRebound[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.hitHandRebound[Hero20002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20002_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillCounterAttackedEnable[Hero20002_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20002_Config.skillCounterAttackedEnable[Hero20002_Define.SkillType.SkillShoot] = {
	true,
	true
}
Hero20002_Config.skillCounterAttackedEnable[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillCounterAttackedRebound[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillCounterAttackedRebound[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillCounterAttackedRebound[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillCounterAttackedKeep[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillCounterAttackedKeep[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillCounterAttackedKeep[Hero20002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillParryEnable[Hero20002_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20002_Config.skillParryEnable[Hero20002_Define.SkillType.SkillShoot] = {
	true,
	true
}
Hero20002_Config.skillParryEnable[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillParryRebound[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillParryRebound[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillParryRebound[Hero20002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20002_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillBeatBackEnable[Hero20002_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20002_Config.skillBeatBackEnable[Hero20002_Define.SkillType.SkillShoot] = {
	false,
	false
}
Hero20002_Config.skillBeatBackEnable[Hero20002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20002_Config.skillHitCombo[Hero20002_Define.SkillType.SkillAimShoot] = {}
Hero20002_Config.skillHitCombo[Hero20002_Define.SkillType.SkillShoot] = {}
Hero20002_Config.skillHitCombo[Hero20002_Define.SkillType.SkillLLL] = {}
Hero20002_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20002_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20002_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20002_Config.skillHitComboAI[Hero20002_Define.SkillType.SkillAimShoot] = {}
Hero20002_Config.skillHitComboAI[Hero20002_Define.SkillType.SkillShoot] = {}
Hero20002_Config.skillHitComboAI[Hero20002_Define.SkillType.SkillLLL] = {}
Hero20002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20002_Config.skillRotationTypeAI[Hero20002_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillRotationTypeAI[Hero20002_Define.SkillType.SkillShoot] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillRotationTypeAI[Hero20002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20002_Config.skillLayer[Hero20002_Define.SkillType.SkillAimShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillLayer[Hero20002_Define.SkillType.SkillShoot] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillLayer[Hero20002_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20002_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20002_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[Hero20002_Define.SkillType.SkillAimShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[Hero20002_Define.SkillType.SkillShoot] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[Hero20002_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20002_Config
