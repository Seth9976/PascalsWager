-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20001_Config.lua

Hero20001_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20001_Config.animatorLayerConfig.BaseLayer = 0
Hero20001_Config.animatorLayerConfig.UpperBody = -1
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillLLL] = 3
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillLHL] = 3
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillLLH] = 3
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillDefence] = 4
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillHH] = 2
Hero20001_Config.skillComboMax[Hero20001_Define.SkillType.SkillDPHH] = 4
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20001_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillLLL] = {}
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillLHL] = {}
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillLLH] = {}
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillDefence] = {}
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillHH] = {}
Hero20001_Config.skillComboSkill[Hero20001_Define.SkillType.SkillDPHH] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20001_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20001_Config.skillHitType[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20001_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillLHL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillLLH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[Hero20001_Define.SkillType.SkillDPHH] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20001_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillLHL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillLLH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[Hero20001_Define.SkillType.SkillDPHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillMultiTarget[Hero20001_Define.SkillType.SkillDPHH] = {
	true,
	true,
	true,
	true
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillBlockedEnable[Hero20001_Define.SkillType.SkillDPHH] = {
	true,
	true,
	true,
	true
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillBlockedRebound[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	true,
	true,
	true
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillLHL] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillLLH] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20001_Config.hitHandEnable[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillLHL] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillLLH] = {
	false,
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20001_Config.hitHandRebound[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillCounterAttackedEnable[Hero20001_Define.SkillType.SkillDPHH] = {
	true,
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillCounterAttackedRebound[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	true,
	true,
	true
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillLHL] = {
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillLLH] = {
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillParryEnable[Hero20001_Define.SkillType.SkillDPHH] = {
	true,
	true,
	true,
	true
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillLHL] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillLLH] = {
	true,
	true,
	true
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20001_Config.skillParryRebound[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	true,
	true,
	true
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillLHL] = {
	false,
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillLLH] = {
	false,
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[Hero20001_Define.SkillType.SkillDPHH] = {
	false,
	false,
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillLLL] = {}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillLHL] = {}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillLLH] = {}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillDefence] = {}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillHH] = {}
Hero20001_Config.skillHitCombo[Hero20001_Define.SkillType.SkillDPHH] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20001_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillLLL] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillLHL] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillLLH] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillDefence] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillHH] = {}
Hero20001_Config.skillHitComboAI[Hero20001_Define.SkillType.SkillDPHH] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillLHL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillLLH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[Hero20001_Define.SkillType.SkillDPHH] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillLHL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillLLH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillHH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[Hero20001_Define.SkillType.SkillDPHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillLHL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillLLH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillHH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[Hero20001_Define.SkillType.SkillDPHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20001_Config
