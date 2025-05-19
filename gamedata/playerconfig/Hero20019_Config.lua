-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20019_Config.lua

Hero20019_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20019_Config.animatorLayerConfig.BaseLayer = 0
Hero20019_Config.animatorLayerConfig.UpperBody = -1
Hero20019_Config.skillComboMax[Hero20019_Define.SkillType.SkillAimShoot] = 3
Hero20019_Config.skillComboMax[Hero20019_Define.SkillType.SkillL] = 1
Hero20019_Config.skillComboMax[Hero20019_Define.SkillType.SkillS] = 1
Hero20019_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20019_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20019_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20019_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20019_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20019_Config.skillComboSkill[Hero20019_Define.SkillType.SkillAimShoot] = {}
Hero20019_Config.skillComboSkill[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20019_Config.skillComboSkill[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20019_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20019_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20019_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20019_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20019_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20019_Config.skillNextType[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20019_Config.skillMoveTypeList[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20019_Config.skillHitType[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20019_Config.skillHitType[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20019_Config.skillHitType[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20019_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light
}
Hero20019_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.Light
}
Hero20019_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.Light
}
Hero20019_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.Light
}
Hero20019_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20019_Config.skillTypeForAI[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20019_Config.skillTypeForAI[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20019_Config.skillTypeForAI[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20019_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20019_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20019_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20019_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20019_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20019_Config.skillColliderShape[Hero20019_Define.SkillType.SkillAimShoot] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20019_Config.skillColliderShape[Hero20019_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20019_Config.skillColliderShape[Hero20019_Define.SkillType.SkillS] = {
	XCube.ShapeType.Point
}
Hero20019_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20019_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20019_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20019_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20019_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20019_Config.skillAttackBoxType[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20019_Config.skillAttackBoxType[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20019_Config.skillAttackBoxType[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20019_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20019_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20019_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20019_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20019_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20019_Config.skillTargetType[Hero20019_Define.SkillType.SkillAimShoot] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[Hero20019_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[Hero20019_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20019_Config.skillMultiTarget[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillMultiTarget[Hero20019_Define.SkillType.SkillL] = {
	false
}
Hero20019_Config.skillMultiTarget[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillDamageType[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20019_Config.skillDamageType[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20019_Config.skillDamageType[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20019_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20019_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20019_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20019_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20019_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20019_Config.skillBlockedEnable[Hero20019_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20019_Config.skillBlockedEnable[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillBlockedEnable[Hero20019_Define.SkillType.SkillS] = {
	true
}
Hero20019_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillBlockedRebound[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillBlockedRebound[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillBlockedRebound[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.hitHandEnable[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.hitHandEnable[Hero20019_Define.SkillType.SkillL] = {
	false
}
Hero20019_Config.hitHandEnable[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.hitHandRebound[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.hitHandRebound[Hero20019_Define.SkillType.SkillL] = {
	false
}
Hero20019_Config.hitHandRebound[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillCounterAttackedEnable[Hero20019_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20019_Config.skillCounterAttackedEnable[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillCounterAttackedEnable[Hero20019_Define.SkillType.SkillS] = {
	true
}
Hero20019_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillCounterAttackedRebound[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillCounterAttackedRebound[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillCounterAttackedRebound[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillCounterAttackedKeep[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillCounterAttackedKeep[Hero20019_Define.SkillType.SkillL] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillParryEnable[Hero20019_Define.SkillType.SkillAimShoot] = {
	true,
	true,
	true
}
Hero20019_Config.skillParryEnable[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillParryEnable[Hero20019_Define.SkillType.SkillS] = {
	true
}
Hero20019_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillParryRebound[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillParryRebound[Hero20019_Define.SkillType.SkillL] = {
	true
}
Hero20019_Config.skillParryRebound[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillBeatBackEnable[Hero20019_Define.SkillType.SkillAimShoot] = {
	false,
	false,
	false
}
Hero20019_Config.skillBeatBackEnable[Hero20019_Define.SkillType.SkillL] = {
	false
}
Hero20019_Config.skillBeatBackEnable[Hero20019_Define.SkillType.SkillS] = {
	false
}
Hero20019_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20019_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20019_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20019_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20019_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20019_Config.skillHitCombo[Hero20019_Define.SkillType.SkillAimShoot] = {}
Hero20019_Config.skillHitCombo[Hero20019_Define.SkillType.SkillL] = {}
Hero20019_Config.skillHitCombo[Hero20019_Define.SkillType.SkillS] = {}
Hero20019_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20019_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20019_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20019_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20019_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20019_Config.skillHitComboAI[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20019_Config.skillHitComboAI[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20019_Config.skillHitComboAI[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20019_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20019_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20019_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20019_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20019_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20019_Config.skillRotationTypeAI[Hero20019_Define.SkillType.SkillAimShoot] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[Hero20019_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[Hero20019_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20019_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20019_Config.skillLayer[Hero20019_Define.SkillType.SkillAimShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20019_Config.skillLayer[Hero20019_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[Hero20019_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20019_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[Hero20019_Define.SkillType.SkillAimShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[Hero20019_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[Hero20019_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20019_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20019_Config
