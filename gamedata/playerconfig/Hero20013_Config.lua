-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20013_Config.lua

Hero20013_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20013_Config.animatorLayerConfig.BaseLayer = 0
Hero20013_Config.animatorLayerConfig.UpperBody = -1
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillL1] = 1
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillO1] = 1
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillO2] = 1
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillLL2] = 2
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillH2] = 1
Hero20013_Config.skillComboMax[Hero20013_Define.SkillType.SkillSP2] = 4
Hero20013_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20013_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20013_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20013_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillL1] = {
	Hero20013_Define.SkillType.SkillO1
}
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillO1] = {
	Hero20013_Define.SkillType.SkillLL2,
	Hero20013_Define.SkillType.SkillH2,
	Hero20013_Define.SkillType.SkillSP2
}
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillO2] = {}
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillLL2] = {}
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillH2] = {}
Hero20013_Config.skillComboSkill[Hero20013_Define.SkillType.SkillSP2] = {}
Hero20013_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20013_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20013_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {
	Hero20013_Define.SkillType.SkillL1,
	Hero20013_Define.SkillType.SkillO1,
	Hero20013_Define.SkillType.SkillO2,
	Hero20013_Define.SkillType.SkillLL2,
	Hero20013_Define.SkillType.SkillH2,
	Hero20013_Define.SkillType.SkillSP2,
	AnimalBase_Define.SkillType.Alert
}
Hero20013_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.HitType.Light
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light
}
Hero20013_Config.skillHitType[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Dizzy,
	AnimalBase_Define.HitType.Up
}
Hero20013_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20013_Config.skillTypeForAI[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillL1] = {
	XCube.ShapeType.Point
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillO1] = {
	XCube.ShapeType.None
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillO2] = {
	XCube.ShapeType.None
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillH2] = {
	XCube.ShapeType.Cube
}
Hero20013_Config.skillColliderShape[Hero20013_Define.SkillType.SkillSP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20013_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.Cube
}
Hero20013_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.Cube
}
Hero20013_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.Cube
}
Hero20013_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20013_Config.skillAttackBoxType[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20013_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[Hero20013_Define.SkillType.SkillSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillH2] = {
	false
}
Hero20013_Config.skillMultiTarget[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20013_Config.skillDamageType[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20013_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillL1] = {
	true
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillBlockedEnable[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillBlockedRebound[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillH2] = {
	false
}
Hero20013_Config.hitHandEnable[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillH2] = {
	false
}
Hero20013_Config.hitHandRebound[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillL1] = {
	true
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillCounterAttackedEnable[Hero20013_Define.SkillType.SkillSP2] = {
	true,
	true,
	true,
	true
}
Hero20013_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillCounterAttackedRebound[Hero20013_Define.SkillType.SkillSP2] = {
	true,
	true,
	true,
	true
}
Hero20013_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillH2] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillParryEnable[Hero20013_Define.SkillType.SkillSP2] = {
	true,
	true,
	true,
	true
}
Hero20013_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillH2] = {
	true
}
Hero20013_Config.skillParryRebound[Hero20013_Define.SkillType.SkillSP2] = {
	true,
	true,
	true,
	true
}
Hero20013_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillL1] = {
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillO1] = {
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillO2] = {
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillH2] = {
	false
}
Hero20013_Config.skillBeatBackEnable[Hero20013_Define.SkillType.SkillSP2] = {
	false,
	false,
	false,
	false
}
Hero20013_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20013_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20013_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20013_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillL1] = {}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillO1] = {}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillO2] = {}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillLL2] = {}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillH2] = {}
Hero20013_Config.skillHitCombo[Hero20013_Define.SkillType.SkillSP2] = {}
Hero20013_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20013_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20013_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20013_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillL1] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillO1] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillO2] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillLL2] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillH2] = {}
Hero20013_Config.skillHitComboAI[Hero20013_Define.SkillType.SkillSP2] = {}
Hero20013_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20013_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20013_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20013_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[Hero20013_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[Hero20013_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20013_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20013_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[Hero20013_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20013_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20013_Config
