-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20015_Config.lua

Hero20015_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20015_Config.animatorLayerConfig.BaseLayer = 0
Hero20015_Config.animatorLayerConfig.UpperBody = -1
Hero20015_Config.skillComboMax[Hero20015_Define.SkillType.SkillDefence] = 4
Hero20015_Config.skillComboMax[Hero20015_Define.SkillType.SkillL] = 1
Hero20015_Config.skillComboMax[Hero20015_Define.SkillType.SkillNH] = 1
Hero20015_Config.skillComboMax[Hero20015_Define.SkillType.SkillO] = 1
Hero20015_Config.skillComboMax[Hero20015_Define.SkillType.SkillH] = 1
Hero20015_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20015_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20015_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20015_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20015_Config.skillComboSkill[Hero20015_Define.SkillType.SkillDefence] = {
	Hero20015_Define.SkillType.SkillL
}
Hero20015_Config.skillComboSkill[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20015_Config.skillComboSkill[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20015_Config.skillComboSkill[Hero20015_Define.SkillType.SkillO] = {}
Hero20015_Config.skillComboSkill[Hero20015_Define.SkillType.SkillH] = {}
Hero20015_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20015_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20015_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20015_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20015_Config.skillNextType[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.Exit
}
Hero20015_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20015_Config.skillMoveTypeList[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20015_Config.skillHitType[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20015_Config.skillHitType[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20015_Config.skillHitType[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20015_Config.skillHitType[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.None
}
Hero20015_Config.skillHitType[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20015_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20015_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20015_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20015_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20015_Config.skillTypeForAI[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20015_Config.skillTypeForAI[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20015_Config.skillTypeForAI[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20015_Config.skillTypeForAI[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20015_Config.skillTypeForAI[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20015_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20015_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20015_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20015_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20015_Config.skillColliderShape[Hero20015_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20015_Config.skillColliderShape[Hero20015_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20015_Config.skillColliderShape[Hero20015_Define.SkillType.SkillNH] = {
	XCube.ShapeType.Capsule
}
Hero20015_Config.skillColliderShape[Hero20015_Define.SkillType.SkillO] = {
	XCube.ShapeType.None
}
Hero20015_Config.skillColliderShape[Hero20015_Define.SkillType.SkillH] = {
	XCube.ShapeType.Capsule
}
Hero20015_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20015_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20015_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20015_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20015_Config.skillAttackBoxType[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillAttackBoxType[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20015_Config.skillAttackBoxType[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20015_Config.skillAttackBoxType[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillAttackBoxType[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20015_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20015_Config.skillTargetType[Hero20015_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[Hero20015_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[Hero20015_Define.SkillType.SkillNH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[Hero20015_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.None
}
Hero20015_Config.skillTargetType[Hero20015_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.None
}
Hero20015_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20015_Config.skillMultiTarget[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillMultiTarget[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillMultiTarget[Hero20015_Define.SkillType.SkillNH] = {
	true
}
Hero20015_Config.skillMultiTarget[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillMultiTarget[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillDamageType[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillDamageType[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20015_Config.skillDamageType[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20015_Config.skillDamageType[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillDamageType[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20015_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20015_Config.skillBlockedEnable[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillBlockedEnable[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillBlockedEnable[Hero20015_Define.SkillType.SkillNH] = {
	true
}
Hero20015_Config.skillBlockedEnable[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillBlockedEnable[Hero20015_Define.SkillType.SkillH] = {
	true
}
Hero20015_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillBlockedRebound[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillBlockedRebound[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillBlockedRebound[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillBlockedRebound[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillBlockedRebound[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.hitHandEnable[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.hitHandEnable[Hero20015_Define.SkillType.SkillL] = {
	false
}
Hero20015_Config.hitHandEnable[Hero20015_Define.SkillType.SkillNH] = {
	true
}
Hero20015_Config.hitHandEnable[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.hitHandEnable[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.hitHandRebound[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.hitHandRebound[Hero20015_Define.SkillType.SkillL] = {
	false
}
Hero20015_Config.hitHandRebound[Hero20015_Define.SkillType.SkillNH] = {
	true
}
Hero20015_Config.hitHandRebound[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.hitHandRebound[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillCounterAttackedEnable[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillCounterAttackedEnable[Hero20015_Define.SkillType.SkillNH] = {
	true
}
Hero20015_Config.skillCounterAttackedEnable[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillCounterAttackedRebound[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillCounterAttackedRebound[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillCounterAttackedKeep[Hero20015_Define.SkillType.SkillL] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillParryEnable[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillParryEnable[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillParryEnable[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillParryEnable[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillParryEnable[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillParryRebound[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillParryRebound[Hero20015_Define.SkillType.SkillL] = {
	true
}
Hero20015_Config.skillParryRebound[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillParryRebound[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillParryRebound[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillBeatBackEnable[Hero20015_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20015_Config.skillBeatBackEnable[Hero20015_Define.SkillType.SkillL] = {
	false
}
Hero20015_Config.skillBeatBackEnable[Hero20015_Define.SkillType.SkillNH] = {
	false
}
Hero20015_Config.skillBeatBackEnable[Hero20015_Define.SkillType.SkillO] = {
	false
}
Hero20015_Config.skillBeatBackEnable[Hero20015_Define.SkillType.SkillH] = {
	false
}
Hero20015_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20015_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20015_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20015_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20015_Config.skillHitCombo[Hero20015_Define.SkillType.SkillDefence] = {}
Hero20015_Config.skillHitCombo[Hero20015_Define.SkillType.SkillL] = {}
Hero20015_Config.skillHitCombo[Hero20015_Define.SkillType.SkillNH] = {}
Hero20015_Config.skillHitCombo[Hero20015_Define.SkillType.SkillO] = {}
Hero20015_Config.skillHitCombo[Hero20015_Define.SkillType.SkillH] = {}
Hero20015_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20015_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20015_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20015_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20015_Config.skillHitComboAI[Hero20015_Define.SkillType.SkillDefence] = {}
Hero20015_Config.skillHitComboAI[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20015_Config.skillHitComboAI[Hero20015_Define.SkillType.SkillNH] = {}
Hero20015_Config.skillHitComboAI[Hero20015_Define.SkillType.SkillO] = {}
Hero20015_Config.skillHitComboAI[Hero20015_Define.SkillType.SkillH] = {}
Hero20015_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20015_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20015_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20015_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20015_Config.skillRotationTypeAI[Hero20015_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[Hero20015_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[Hero20015_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[Hero20015_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[Hero20015_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20015_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20015_Config.skillLayer[Hero20015_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20015_Config.skillLayer[Hero20015_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[Hero20015_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[Hero20015_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[Hero20015_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20015_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[Hero20015_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[Hero20015_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[Hero20015_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[Hero20015_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[Hero20015_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20015_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20015_Config
