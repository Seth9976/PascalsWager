-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20011_Config.lua

Hero20011_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20011_Config.animatorLayerConfig.BaseLayer = 0
Hero20011_Config.animatorLayerConfig.UpperBody = -1
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillLL] = 2
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillD] = 1
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillSP] = 4
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillHP] = 1
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillH] = 1
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillO] = 1
Hero20011_Config.skillComboMax[Hero20011_Define.SkillType.SkillHPC] = 1
Hero20011_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20011_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20011_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillLL] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillD] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillSP] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillHP] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillH] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillO] = {}
Hero20011_Config.skillComboSkill[Hero20011_Define.SkillType.SkillHPC] = {}
Hero20011_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20011_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20011_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.Dizzy,
	AnimalBase_Define.HitType.PullFrontDizzy,
	AnimalBase_Define.HitType.LightDizzy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.HitType.Light
}
Hero20011_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20011_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20011_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Pull,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20011_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20011_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20011_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillD] = {
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillSP] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillO] = {
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[Hero20011_Define.SkillType.SkillHPC] = {
	XCube.ShapeType.Cube
}
Hero20011_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20011_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20011_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20011_Config.skillAttackBoxType[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20011_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20011_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20011_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[Hero20011_Define.SkillType.SkillHPC] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20011_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillHP] = {
	true
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillH] = {
	true
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillO] = {
	true
}
Hero20011_Config.skillMultiTarget[Hero20011_Define.SkillType.SkillHPC] = {
	true
}
Hero20011_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20011_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20011_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20011_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillHP] = {
	true
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillH] = {
	true
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillO] = {
	true
}
Hero20011_Config.skillBlockedEnable[Hero20011_Define.SkillType.SkillHPC] = {
	true
}
Hero20011_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.skillBlockedRebound[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillD] = {
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillHP] = {
	true
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.hitHandEnable[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillD] = {
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillHP] = {
	true
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.hitHandRebound[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillHP] = {
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillH] = {
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillO] = {
	true
}
Hero20011_Config.skillCounterAttackedEnable[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillH] = {
	true
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillO] = {
	true
}
Hero20011_Config.skillCounterAttackedRebound[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillD] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.skillParryEnable[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillD] = {
	true
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.skillParryRebound[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillD] = {
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillHP] = {
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillH] = {
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillO] = {
	false
}
Hero20011_Config.skillBeatBackEnable[Hero20011_Define.SkillType.SkillHPC] = {
	false
}
Hero20011_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20011_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20011_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillLL] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillD] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillSP] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillHP] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillH] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillO] = {}
Hero20011_Config.skillHitCombo[Hero20011_Define.SkillType.SkillHPC] = {}
Hero20011_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20011_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20011_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillLL] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillD] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillSP] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillHP] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillH] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillO] = {}
Hero20011_Config.skillHitComboAI[Hero20011_Define.SkillType.SkillHPC] = {}
Hero20011_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20011_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20011_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[Hero20011_Define.SkillType.SkillHPC] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[Hero20011_Define.SkillType.SkillHPC] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20011_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[Hero20011_Define.SkillType.SkillHPC] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20011_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20011_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20011_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20011_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20011_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20011_Config
