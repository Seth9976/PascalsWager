-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20018_Config.lua

Hero20018_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20018_Config.animatorLayerConfig.BaseLayer = 0
Hero20018_Config.animatorLayerConfig.UpperBody = -1
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillL] = 1
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillH] = 1
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillDefence] = 4
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillNL] = 1
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillNH] = 1
Hero20018_Config.skillComboMax[Hero20018_Define.SkillType.SkillNSP] = 3
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20018_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillL] = {}
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillH] = {}
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillDefence] = {
	Hero20018_Define.SkillType.SkillNL
}
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillNL] = {}
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillNH] = {}
Hero20018_Config.skillComboSkill[Hero20018_Define.SkillType.SkillNSP] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20018_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.Light
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20018_Config.skillHitType[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20018_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20018_Config.skillTypeForAI[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20018_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillH] = {
	XCube.ShapeType.Point
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillNH] = {
	XCube.ShapeType.Cube
}
Hero20018_Config.skillColliderShape[Hero20018_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20018_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20018_Config.skillAttackBoxType[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillNH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[Hero20018_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillMultiTarget[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20018_Config.skillDamageType[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillBlockedEnable[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillBlockedRebound[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillNH] = {
	false
}
Hero20018_Config.hitHandEnable[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillH] = {
	false
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillNH] = {
	false
}
Hero20018_Config.hitHandRebound[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillCounterAttackedEnable[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillCounterAttackedRebound[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillL] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillH] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillNL] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillNH] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[Hero20018_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillH] = {
	true
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillParryEnable[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	true
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillL] = {
	true
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillH] = {
	false
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillNL] = {
	true
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillNH] = {
	true
}
Hero20018_Config.skillParryRebound[Hero20018_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillL] = {
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillH] = {
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillNL] = {
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillNH] = {
	false
}
Hero20018_Config.skillBeatBackEnable[Hero20018_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20018_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillL] = {}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillH] = {}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillDefence] = {}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillNL] = {}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillNH] = {}
Hero20018_Config.skillHitCombo[Hero20018_Define.SkillType.SkillNSP] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20018_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillL] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillH] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillDefence] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillNL] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillNH] = {}
Hero20018_Config.skillHitComboAI[Hero20018_Define.SkillType.SkillNSP] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20018_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[Hero20018_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[Hero20018_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[Hero20018_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20018_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20018_Config
