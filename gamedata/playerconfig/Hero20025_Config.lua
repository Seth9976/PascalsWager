-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20025_Config.lua

Hero20025_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20025_Config.animatorLayerConfig.BaseLayer = 0
Hero20025_Config.animatorLayerConfig.UpperBody = -1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillL1] = 1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillH1] = 1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillDD1] = 2
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillO1] = 1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillL2] = 1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillH2] = 1
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillDD2] = 4
Hero20025_Config.skillComboMax[Hero20025_Define.SkillType.SkillO2] = 1
Hero20025_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20025_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20025_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20025_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillL1] = {}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillH1] = {}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillDD1] = {
	Hero20025_Define.SkillType.SkillH1
}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillO1] = {}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillL2] = {}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillH2] = {}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillDD2] = {
	Hero20025_Define.SkillType.SkillH2
}
Hero20025_Config.skillComboSkill[Hero20025_Define.SkillType.SkillO2] = {}
Hero20025_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20025_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20025_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20025_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.HitType.Light
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.HitType.Light
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20025_Config.skillHitType[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20025_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.Light
}
Hero20025_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.Light
}
Hero20025_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.Light
}
Hero20025_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20025_Config.skillTypeForAI[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20025_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20025_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20025_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20025_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillL1] = {
	XCube.ShapeType.Point
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillH1] = {
	XCube.ShapeType.Cube
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillDD1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillO1] = {
	XCube.ShapeType.None
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillL2] = {
	XCube.ShapeType.Point
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillH2] = {
	XCube.ShapeType.Cube
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillDD2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20025_Config.skillColliderShape[Hero20025_Define.SkillType.SkillO2] = {
	XCube.ShapeType.Point
}
Hero20025_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20025_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20025_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20025_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20025_Config.skillAttackBoxType[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20025_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20025_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20025_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20025_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillDD1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillL2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillDD2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[Hero20025_Define.SkillType.SkillO2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillL1] = {
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillH1] = {
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillL2] = {
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillH2] = {
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	true,
	true
}
Hero20025_Config.skillMultiTarget[Hero20025_Define.SkillType.SkillO2] = {
	true
}
Hero20025_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.None
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20025_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20025_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20025_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20025_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillL1] = {
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillH1] = {
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillO1] = {
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillL2] = {
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillH2] = {
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillDD2] = {
	true,
	true,
	true,
	true
}
Hero20025_Config.skillBlockedEnable[Hero20025_Define.SkillType.SkillO2] = {
	true
}
Hero20025_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	false,
	false
}
Hero20025_Config.skillBlockedRebound[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillDD1] = {
	false,
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	false,
	false
}
Hero20025_Config.hitHandEnable[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillDD1] = {
	false,
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	false,
	false
}
Hero20025_Config.hitHandRebound[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillL1] = {
	true
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillH1] = {
	true
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillL2] = {
	true
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillH2] = {
	true
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	true,
	false,
	false
}
Hero20025_Config.skillCounterAttackedEnable[Hero20025_Define.SkillType.SkillO2] = {
	true
}
Hero20025_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillH2] = {
	true
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	true,
	false,
	false
}
Hero20025_Config.skillCounterAttackedRebound[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillDD1] = {
	false,
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	false,
	false
}
Hero20025_Config.skillCounterAttackedKeep[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillL1] = {
	true
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillL2] = {
	true
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	true,
	false,
	false
}
Hero20025_Config.skillParryEnable[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillDD1] = {
	true,
	true
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillL2] = {
	true
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	true,
	false,
	false
}
Hero20025_Config.skillParryRebound[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillL1] = {
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillH1] = {
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillDD1] = {
	false,
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillO1] = {
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillL2] = {
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillH2] = {
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillDD2] = {
	false,
	false,
	false,
	false
}
Hero20025_Config.skillBeatBackEnable[Hero20025_Define.SkillType.SkillO2] = {
	false
}
Hero20025_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20025_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20025_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20025_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillL1] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillH1] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillDD1] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillL2] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillH2] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillDD2] = {}
Hero20025_Config.skillHitCombo[Hero20025_Define.SkillType.SkillO2] = {}
Hero20025_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20025_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20025_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20025_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20025_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20025_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20025_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20025_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillDD1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillDD2] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[Hero20025_Define.SkillType.SkillO2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillDD1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillL2] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillDD2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20025_Config.skillLayer[Hero20025_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20025_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillDD1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillL2] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillDD2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[Hero20025_Define.SkillType.SkillO2] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20025_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20025_Config
