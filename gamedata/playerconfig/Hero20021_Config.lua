-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20021_Config.lua

Hero20021_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20021_Config.animatorLayerConfig.BaseLayer = 0
Hero20021_Config.animatorLayerConfig.UpperBody = -1
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillLPL] = 2
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillLLLL] = 4
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillHPH] = 2
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillHHH] = 3
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillDefence] = 4
Hero20021_Config.skillComboMax[Hero20021_Define.SkillType.SkillHPHC] = 1
Hero20021_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20021_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20021_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 3
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillLPL] = {}
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillLLLL] = {}
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillHPH] = {}
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillHHH] = {}
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillDefence] = {}
Hero20021_Config.skillComboSkill[Hero20021_Define.SkillType.SkillHPHC] = {}
Hero20021_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20021_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20021_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Up
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Up
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20021_Config.skillHitType[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.HitType.Down
}
Hero20021_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20021_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20021_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20021_Config.skillTypeForAI[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20021_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20021_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20021_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillLPL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillLLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillHPH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillHHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20021_Config.skillColliderShape[Hero20021_Define.SkillType.SkillHPHC] = {
	XCube.ShapeType.Cube
}
Hero20021_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20021_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20021_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20021_Config.skillAttackBoxType[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20021_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20021_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20021_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillLPL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillLLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillHPH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillHHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[Hero20021_Define.SkillType.SkillHPHC] = {
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillMultiTarget[Hero20021_Define.SkillType.SkillHPHC] = {
	true
}
Hero20021_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20021_Config.skillDamageType[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20021_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20021_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20021_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillBlockedEnable[Hero20021_Define.SkillType.SkillHPHC] = {
	true
}
Hero20021_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillLPL] = {
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillHPH] = {
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillBlockedRebound[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillLPL] = {
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillHPH] = {
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.hitHandEnable[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillLPL] = {
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillHPH] = {
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.hitHandRebound[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedEnable[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedRebound[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillLPL] = {
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillHPH] = {
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillCounterAttackedKeep[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillParryEnable[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillLPL] = {
	true,
	true
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillHPH] = {
	true,
	true
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillParryRebound[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillLPL] = {
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillHPH] = {
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20021_Config.skillBeatBackEnable[Hero20021_Define.SkillType.SkillHPHC] = {
	false
}
Hero20021_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20021_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20021_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillLPL] = {}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillLLLL] = {}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillHPH] = {}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillHHH] = {}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillDefence] = {}
Hero20021_Config.skillHitCombo[Hero20021_Define.SkillType.SkillHPHC] = {}
Hero20021_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20021_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20021_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillLPL] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillLLLL] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillHPH] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillHHH] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillDefence] = {}
Hero20021_Config.skillHitComboAI[Hero20021_Define.SkillType.SkillHPHC] = {}
Hero20021_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20021_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20021_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillLPL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillHPH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[Hero20021_Define.SkillType.SkillHPHC] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillLPL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillHPH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillLayer[Hero20021_Define.SkillType.SkillHPHC] = {
	"BaseLayer"
}
Hero20021_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20021_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20021_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillLPL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillHPH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[Hero20021_Define.SkillType.SkillHPHC] = {
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20021_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}

return Hero20021_Config
