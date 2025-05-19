-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20016_Config.lua

Hero20016_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20016_Config.animatorLayerConfig.BaseLayer = 0
Hero20016_Config.animatorLayerConfig.UpperBody = -1
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillL] = 1
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillH] = 1
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillNL] = 4
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillDefence] = 4
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillOP] = 2
Hero20016_Config.skillComboMax[Hero20016_Define.SkillType.SkillO] = 2
Hero20016_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20016_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20016_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 3
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillL] = {}
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillH] = {}
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillNL] = {}
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillDefence] = {
	Hero20016_Define.SkillType.SkillNL
}
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillOP] = {}
Hero20016_Config.skillComboSkill[Hero20016_Define.SkillType.SkillO] = {}
Hero20016_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20016_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20016_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.LightFreeze,
	AnimalBase_Define.HitType.PullFrontFreeze,
	AnimalBase_Define.HitType.LightFreeze,
	AnimalBase_Define.HitType.Heavy
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero20016_Config.skillHitType[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero20016_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20016_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20016_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Pull,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20016_Config.skillTypeForAI[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20016_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20016_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20016_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillOP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20016_Config.skillColliderShape[Hero20016_Define.SkillType.SkillO] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20016_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20016_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20016_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20016_Config.skillAttackBoxType[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20016_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20016_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20016_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[Hero20016_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20016_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillNL] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20016_Config.skillMultiTarget[Hero20016_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20016_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20016_Config.skillDamageType[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20016_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20016_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20016_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	true
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillDefence] = {
	true,
	false,
	false,
	false
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20016_Config.skillBlockedEnable[Hero20016_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20016_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	true
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillDefence] = {
	true,
	false,
	false,
	false
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20016_Config.skillBlockedRebound[Hero20016_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20016_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillL] = {
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillH] = {
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillNL] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20016_Config.hitHandEnable[Hero20016_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20016_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillL] = {
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillH] = {
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillNL] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20016_Config.hitHandRebound[Hero20016_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20016_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	false
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillOP] = {
	true,
	false
}
Hero20016_Config.skillCounterAttackedEnable[Hero20016_Define.SkillType.SkillO] = {
	true,
	false
}
Hero20016_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	false
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillOP] = {
	true,
	false
}
Hero20016_Config.skillCounterAttackedRebound[Hero20016_Define.SkillType.SkillO] = {
	true,
	false
}
Hero20016_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillL] = {
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillH] = {
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillNL] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20016_Config.skillCounterAttackedKeep[Hero20016_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20016_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	false
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillOP] = {
	true,
	false
}
Hero20016_Config.skillParryEnable[Hero20016_Define.SkillType.SkillO] = {
	true,
	false
}
Hero20016_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillL] = {
	true
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillH] = {
	true
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillNL] = {
	true,
	true,
	true,
	false
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillOP] = {
	true,
	false
}
Hero20016_Config.skillParryRebound[Hero20016_Define.SkillType.SkillO] = {
	true,
	false
}
Hero20016_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillL] = {
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillH] = {
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillNL] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20016_Config.skillBeatBackEnable[Hero20016_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20016_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20016_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20016_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillL] = {}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillH] = {}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillNL] = {}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillDefence] = {}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillOP] = {}
Hero20016_Config.skillHitCombo[Hero20016_Define.SkillType.SkillO] = {}
Hero20016_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20016_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20016_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillL] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillH] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillNL] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillDefence] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillOP] = {}
Hero20016_Config.skillHitComboAI[Hero20016_Define.SkillType.SkillO] = {}
Hero20016_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20016_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20016_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[Hero20016_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillNL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillLayer[Hero20016_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20016_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20016_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillNL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[Hero20016_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20016_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}

return Hero20016_Config
