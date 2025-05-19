-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20004_Config.lua

Hero20004_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20004_Config.animatorLayerConfig.BaseLayer = 0
Hero20004_Config.animatorLayerConfig.UpperBody = -1
Hero20004_Config.skillComboMax[Hero20004_Define.SkillType.SkillLL] = 2
Hero20004_Config.skillComboMax[Hero20004_Define.SkillType.SkillH] = 1
Hero20004_Config.skillComboMax[Hero20004_Define.SkillType.SkillS] = 1
Hero20004_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20004_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20004_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20004_Config.skillComboSkill[Hero20004_Define.SkillType.SkillLL] = {}
Hero20004_Config.skillComboSkill[Hero20004_Define.SkillType.SkillH] = {}
Hero20004_Config.skillComboSkill[Hero20004_Define.SkillType.SkillS] = {}
Hero20004_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20004_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20004_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20004_Config.skillNextType[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillNextType[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillNextType[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20004_Config.skillMoveTypeList[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillMoveTypeList[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillMoveTypeList[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20004_Config.skillHitType[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20004_Config.skillHitType[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20004_Config.skillHitType[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20004_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20004_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20004_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20004_Config.skillTypeForAI[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20004_Config.skillTypeForAI[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20004_Config.skillTypeForAI[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20004_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20004_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20004_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20004_Config.skillColliderShape[Hero20004_Define.SkillType.SkillLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20004_Config.skillColliderShape[Hero20004_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20004_Config.skillColliderShape[Hero20004_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube
}
Hero20004_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20004_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20004_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20004_Config.skillAttackBoxType[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20004_Config.skillAttackBoxType[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20004_Config.skillAttackBoxType[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20004_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20004_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20004_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20004_Config.skillTargetType[Hero20004_Define.SkillType.SkillLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20004_Config.skillTargetType[Hero20004_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20004_Config.skillTargetType[Hero20004_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20004_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20004_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20004_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20004_Config.skillMultiTarget[Hero20004_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20004_Config.skillMultiTarget[Hero20004_Define.SkillType.SkillH] = {
	true
}
Hero20004_Config.skillMultiTarget[Hero20004_Define.SkillType.SkillS] = {
	true
}
Hero20004_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillDamageType[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20004_Config.skillDamageType[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20004_Config.skillDamageType[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20004_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20004_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20004_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20004_Config.skillBlockedEnable[Hero20004_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20004_Config.skillBlockedEnable[Hero20004_Define.SkillType.SkillH] = {
	true
}
Hero20004_Config.skillBlockedEnable[Hero20004_Define.SkillType.SkillS] = {
	true
}
Hero20004_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillBlockedRebound[Hero20004_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20004_Config.skillBlockedRebound[Hero20004_Define.SkillType.SkillH] = {
	true
}
Hero20004_Config.skillBlockedRebound[Hero20004_Define.SkillType.SkillS] = {
	true
}
Hero20004_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillCounterAttackedEnable[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillCounterAttackedEnable[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillCounterAttackedEnable[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillCounterAttackedRebound[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillCounterAttackedRebound[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillCounterAttackedRebound[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillCounterAttackedKeep[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillCounterAttackedKeep[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillCounterAttackedKeep[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillParryEnable[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillParryEnable[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillParryEnable[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillParryRebound[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillParryRebound[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillParryRebound[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillBeatBackEnable[Hero20004_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20004_Config.skillBeatBackEnable[Hero20004_Define.SkillType.SkillH] = {
	false
}
Hero20004_Config.skillBeatBackEnable[Hero20004_Define.SkillType.SkillS] = {
	false
}
Hero20004_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20004_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20004_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20004_Config.skillHitCombo[Hero20004_Define.SkillType.SkillLL] = {}
Hero20004_Config.skillHitCombo[Hero20004_Define.SkillType.SkillH] = {}
Hero20004_Config.skillHitCombo[Hero20004_Define.SkillType.SkillS] = {}
Hero20004_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20004_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20004_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20004_Config.skillHitComboAI[Hero20004_Define.SkillType.SkillLL] = {}
Hero20004_Config.skillHitComboAI[Hero20004_Define.SkillType.SkillH] = {}
Hero20004_Config.skillHitComboAI[Hero20004_Define.SkillType.SkillS] = {}
Hero20004_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20004_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20004_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20004_Config.skillRotationTypeAI[Hero20004_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillRotationTypeAI[Hero20004_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillRotationTypeAI[Hero20004_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20004_Config.skillLayer[Hero20004_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20004_Config.skillLayer[Hero20004_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20004_Config.skillLayer[Hero20004_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20004_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20004_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20004_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[Hero20004_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[Hero20004_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[Hero20004_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20004_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20004_Config
