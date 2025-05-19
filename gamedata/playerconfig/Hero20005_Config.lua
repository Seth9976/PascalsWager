-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20005_Config.lua

Hero20005_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20005_Config.animatorLayerConfig.BaseLayer = 0
Hero20005_Config.animatorLayerConfig.UpperBody = -1
Hero20005_Config.skillComboMax[Hero20005_Define.SkillType.SkillLLL] = 3
Hero20005_Config.skillComboMax[Hero20005_Define.SkillType.SkillH] = 1
Hero20005_Config.skillComboMax[Hero20005_Define.SkillType.SkillSP] = 3
Hero20005_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20005_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20005_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20005_Config.skillComboSkill[Hero20005_Define.SkillType.SkillLLL] = {}
Hero20005_Config.skillComboSkill[Hero20005_Define.SkillType.SkillH] = {}
Hero20005_Config.skillComboSkill[Hero20005_Define.SkillType.SkillSP] = {}
Hero20005_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20005_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20005_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20005_Config.skillNextType[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20005_Config.skillNextType[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20005_Config.skillNextType[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20005_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20005_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20005_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20005_Config.skillMoveTypeList[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillMoveTypeList[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillMoveTypeList[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20005_Config.skillHitType[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20005_Config.skillHitType[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20005_Config.skillHitType[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20005_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20005_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20005_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20005_Config.skillTypeForAI[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20005_Config.skillTypeForAI[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20005_Config.skillTypeForAI[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20005_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20005_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20005_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20005_Config.skillColliderShape[Hero20005_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20005_Config.skillColliderShape[Hero20005_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20005_Config.skillColliderShape[Hero20005_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Capsule,
	XCube.ShapeType.Capsule,
	XCube.ShapeType.Capsule
}
Hero20005_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20005_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20005_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20005_Config.skillAttackBoxType[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20005_Config.skillAttackBoxType[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20005_Config.skillAttackBoxType[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20005_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20005_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20005_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20005_Config.skillTargetType[Hero20005_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20005_Config.skillTargetType[Hero20005_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20005_Config.skillTargetType[Hero20005_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20005_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20005_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20005_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20005_Config.skillMultiTarget[Hero20005_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20005_Config.skillMultiTarget[Hero20005_Define.SkillType.SkillH] = {
	true
}
Hero20005_Config.skillMultiTarget[Hero20005_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20005_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillDamageType[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20005_Config.skillDamageType[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20005_Config.skillDamageType[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20005_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20005_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20005_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20005_Config.skillBlockedEnable[Hero20005_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20005_Config.skillBlockedEnable[Hero20005_Define.SkillType.SkillH] = {
	true
}
Hero20005_Config.skillBlockedEnable[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillBlockedRebound[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.skillBlockedRebound[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.skillBlockedRebound[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.hitHandEnable[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.hitHandEnable[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.hitHandEnable[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.hitHandRebound[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.hitHandRebound[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.hitHandRebound[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillCounterAttackedEnable[Hero20005_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20005_Config.skillCounterAttackedEnable[Hero20005_Define.SkillType.SkillH] = {
	true
}
Hero20005_Config.skillCounterAttackedEnable[Hero20005_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20005_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillCounterAttackedRebound[Hero20005_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20005_Config.skillCounterAttackedRebound[Hero20005_Define.SkillType.SkillH] = {
	true
}
Hero20005_Config.skillCounterAttackedRebound[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillCounterAttackedKeep[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.skillCounterAttackedKeep[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.skillCounterAttackedKeep[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillParryEnable[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.skillParryEnable[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.skillParryEnable[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillParryRebound[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.skillParryRebound[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.skillParryRebound[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillBeatBackEnable[Hero20005_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20005_Config.skillBeatBackEnable[Hero20005_Define.SkillType.SkillH] = {
	false
}
Hero20005_Config.skillBeatBackEnable[Hero20005_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20005_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20005_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20005_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20005_Config.skillHitCombo[Hero20005_Define.SkillType.SkillLLL] = {}
Hero20005_Config.skillHitCombo[Hero20005_Define.SkillType.SkillH] = {}
Hero20005_Config.skillHitCombo[Hero20005_Define.SkillType.SkillSP] = {}
Hero20005_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20005_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20005_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20005_Config.skillHitComboAI[Hero20005_Define.SkillType.SkillLLL] = {}
Hero20005_Config.skillHitComboAI[Hero20005_Define.SkillType.SkillH] = {}
Hero20005_Config.skillHitComboAI[Hero20005_Define.SkillType.SkillSP] = {}
Hero20005_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20005_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20005_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20005_Config.skillRotationTypeAI[Hero20005_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20005_Config.skillRotationTypeAI[Hero20005_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20005_Config.skillRotationTypeAI[Hero20005_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20005_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20005_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20005_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20005_Config.skillLayer[Hero20005_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20005_Config.skillLayer[Hero20005_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20005_Config.skillLayer[Hero20005_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20005_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20005_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20005_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[Hero20005_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[Hero20005_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[Hero20005_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20005_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20005_Config
