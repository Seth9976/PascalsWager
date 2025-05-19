-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20006_Config.lua

Hero20006_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20006_Config.animatorLayerConfig.BaseLayer = 0
Hero20006_Config.animatorLayerConfig.UpperBody = -1
Hero20006_Config.skillComboMax[Hero20006_Define.SkillType.SkillLLL] = 3
Hero20006_Config.skillComboMax[Hero20006_Define.SkillType.SkillH] = 1
Hero20006_Config.skillComboMax[Hero20006_Define.SkillType.SkillS] = 1
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20006_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20006_Config.skillComboSkill[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20006_Config.skillComboSkill[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20006_Config.skillComboSkill[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20006_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20006_Config.skillNextType[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20006_Config.skillMoveTypeList[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20006_Config.skillHitType[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20006_Config.skillHitType[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20006_Config.skillHitType[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero20006_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20006_Config.skillTypeForAI[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20006_Config.skillTypeForAI[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20006_Config.skillTypeForAI[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20006_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20006_Config.skillColliderShape[Hero20006_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20006_Config.skillColliderShape[Hero20006_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20006_Config.skillColliderShape[Hero20006_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20006_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20006_Config.skillAttackBoxType[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20006_Config.skillAttackBoxType[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20006_Config.skillAttackBoxType[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20006_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20006_Config.skillTargetType[Hero20006_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[Hero20006_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[Hero20006_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.None
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20006_Config.skillMultiTarget[Hero20006_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20006_Config.skillMultiTarget[Hero20006_Define.SkillType.SkillH] = {
	true
}
Hero20006_Config.skillMultiTarget[Hero20006_Define.SkillType.SkillS] = {
	true
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillDamageType[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20006_Config.skillDamageType[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20006_Config.skillDamageType[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20006_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20006_Config.skillBlockedEnable[Hero20006_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20006_Config.skillBlockedEnable[Hero20006_Define.SkillType.SkillH] = {
	true
}
Hero20006_Config.skillBlockedEnable[Hero20006_Define.SkillType.SkillS] = {
	true
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillBlockedRebound[Hero20006_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20006_Config.skillBlockedRebound[Hero20006_Define.SkillType.SkillH] = {
	true
}
Hero20006_Config.skillBlockedRebound[Hero20006_Define.SkillType.SkillS] = {
	true
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.hitHandEnable[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.hitHandEnable[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.hitHandEnable[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.hitHandRebound[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.hitHandRebound[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.hitHandRebound[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedEnable[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.skillCounterAttackedEnable[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedRebound[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.skillCounterAttackedRebound[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedKeep[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.skillCounterAttackedKeep[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillParryEnable[Hero20006_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20006_Config.skillParryEnable[Hero20006_Define.SkillType.SkillH] = {
	true
}
Hero20006_Config.skillParryEnable[Hero20006_Define.SkillType.SkillS] = {
	true
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillParryRebound[Hero20006_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20006_Config.skillParryRebound[Hero20006_Define.SkillType.SkillH] = {
	true
}
Hero20006_Config.skillParryRebound[Hero20006_Define.SkillType.SkillS] = {
	true
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillBeatBackEnable[Hero20006_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20006_Config.skillBeatBackEnable[Hero20006_Define.SkillType.SkillH] = {
	false
}
Hero20006_Config.skillBeatBackEnable[Hero20006_Define.SkillType.SkillS] = {
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20006_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20006_Config.skillHitCombo[Hero20006_Define.SkillType.SkillLLL] = {}
Hero20006_Config.skillHitCombo[Hero20006_Define.SkillType.SkillH] = {}
Hero20006_Config.skillHitCombo[Hero20006_Define.SkillType.SkillS] = {}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20006_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20006_Config.skillHitComboAI[Hero20006_Define.SkillType.SkillLLL] = {}
Hero20006_Config.skillHitComboAI[Hero20006_Define.SkillType.SkillH] = {}
Hero20006_Config.skillHitComboAI[Hero20006_Define.SkillType.SkillS] = {}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20006_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20006_Config.skillRotationTypeAI[Hero20006_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[Hero20006_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[Hero20006_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20006_Config.skillLayer[Hero20006_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20006_Config.skillLayer[Hero20006_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[Hero20006_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20006_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[Hero20006_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[Hero20006_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[Hero20006_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20006_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20006_Config
