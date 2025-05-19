-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero90007_Config.lua

Hero90007_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero90007_Config.animatorLayerConfig.BaseLayer = 0
Hero90007_Config.animatorLayerConfig.UpperBody = -1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillL] = 1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillH] = 1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillLP] = 1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillO] = 1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillS] = 1
Hero90007_Config.skillComboMax[Hero90007_Define.SkillType.SkillD] = 1
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillL] = {
	Hero90007_Define.SkillType.SkillD
}
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillH] = {
	Hero90007_Define.SkillType.SkillD
}
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillLP] = {
	Hero90007_Define.SkillType.SkillD
}
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillO] = {
	Hero90007_Define.SkillType.SkillD
}
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillS] = {}
Hero90007_Config.skillComboSkill[Hero90007_Define.SkillType.SkillD] = {}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillNextType[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillMoveTypeList[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillRecoveryMoveTypeList[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Heavy
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Up
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero90007_Config.skillHitType[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.None
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero90007_Config.skillTypeForAI[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillO] = {
	XCube.ShapeType.Cube
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero90007_Config.skillColliderShape[Hero90007_Define.SkillType.SkillD] = {
	XCube.ShapeType.None
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90007_Config.skillAttackBoxType[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillTargetType[Hero90007_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillMultiTarget[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero90007_Config.skillDamageType[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.None
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillBlockedEnable[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillBlockedRebound[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillL] = {
	true
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillH] = {
	true
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillLP] = {
	true
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillO] = {
	true
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillS] = {
	true
}
Hero90007_Config.hitHandEnable[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.hitHandRebound[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillCounterAttackedEnable[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillCounterAttackedRebound[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillCounterAttackedKeep[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillParryEnable[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillParryRebound[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillL] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillH] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillLP] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillO] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillS] = {
	false
}
Hero90007_Config.skillBeatBackEnable[Hero90007_Define.SkillType.SkillD] = {
	false
}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillL] = {}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillH] = {}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillLP] = {}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillO] = {}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillS] = {}
Hero90007_Config.skillHitCombo[Hero90007_Define.SkillType.SkillD] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillL] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillH] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillLP] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillO] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillS] = {}
Hero90007_Config.skillHitComboAI[Hero90007_Define.SkillType.SkillD] = {}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillRotationTypeAI[Hero90007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero90007_Config.skillLayer[Hero90007_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero90007_Config.skillRecoveryLayer[Hero90007_Define.SkillType.SkillD] = {
	"BaseLayer"
}

return Hero90007_Config
