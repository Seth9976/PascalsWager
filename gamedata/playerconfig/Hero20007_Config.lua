-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20007_Config.lua

Hero20007_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20007_Config.animatorLayerConfig.BaseLayer = 0
Hero20007_Config.animatorLayerConfig.UpperBody = 1
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillHPL] = 2
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillHLL] = 3
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillLPH] = 2
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillLHH] = 3
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillLS] = 2
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillS] = 1
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillD] = 1
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillSPP] = 4
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillSP] = 4
Hero20007_Config.skillComboMax[Hero20007_Define.SkillType.SkillOP] = 1
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillHPL] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillHLL] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillLPH] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillLHH] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillLS] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillS] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillD] = {
	Hero20007_Define.SkillType.SkillD
}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillSPP] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillSP] = {}
Hero20007_Config.skillComboSkill[Hero20007_Define.SkillType.SkillOP] = {}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndRecovery
}
Hero20007_Config.skillNextType[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillMoveTypeList[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillRecoveryMoveTypeList[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Down
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Down
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20007_Config.skillHitType[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.FrontFlyFar
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillTypeForAI[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillHPL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillHLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillLPH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillLHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillLS] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillS] = {
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillD] = {
	XCube.ShapeType.Capsule
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillSPP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20007_Config.skillColliderShape[Hero20007_Define.SkillType.SkillOP] = {
	XCube.ShapeType.Capsule
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20007_Config.skillAttackBoxType[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillHPL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillHLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillLPH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillLHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillLS] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillSPP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillTargetType[Hero20007_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillD] = {
	true
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillSPP] = {
	true,
	true,
	true,
	false
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillSP] = {
	true,
	true,
	false,
	false
}
Hero20007_Config.skillMultiTarget[Hero20007_Define.SkillType.SkillOP] = {
	true
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillDamageType[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillD] = {
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillSPP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillBlockedEnable[Hero20007_Define.SkillType.SkillOP] = {
	true
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillHPL] = {
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillHLL] = {
	false,
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillLPH] = {
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillLHH] = {
	false,
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillLS] = {
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillS] = {
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillBlockedRebound[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillHPL] = {
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillHLL] = {
	false,
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillLPH] = {
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillLHH] = {
	false,
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillLS] = {
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.hitHandEnable[Hero20007_Define.SkillType.SkillOP] = {
	true
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillHPL] = {
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillHLL] = {
	false,
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillLPH] = {
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillLHH] = {
	false,
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillLS] = {
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillS] = {
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.hitHandRebound[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillD] = {
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillSPP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedEnable[Hero20007_Define.SkillType.SkillOP] = {
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillD] = {
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillSP] = {
	false,
	true,
	true,
	true
}
Hero20007_Config.skillCounterAttackedRebound[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillHPL] = {
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillHLL] = {
	false,
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillLPH] = {
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillLHH] = {
	false,
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillLS] = {
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillS] = {
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillCounterAttackedKeep[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillSPP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillParryEnable[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillHPL] = {
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillHLL] = {
	true,
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillLPH] = {
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillLHH] = {
	true,
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillLS] = {
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillS] = {
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillSPP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillSP] = {
	true,
	true,
	true,
	true
}
Hero20007_Config.skillParryRebound[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillHPL] = {
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillHLL] = {
	false,
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillLPH] = {
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillLHH] = {
	false,
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillLS] = {
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillS] = {
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillD] = {
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillSPP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillSP] = {
	false,
	false,
	false,
	false
}
Hero20007_Config.skillBeatBackEnable[Hero20007_Define.SkillType.SkillOP] = {
	false
}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillHPL] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillHLL] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillLPH] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillLHH] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillLS] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillS] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillD] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillSPP] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillSP] = {}
Hero20007_Config.skillHitCombo[Hero20007_Define.SkillType.SkillOP] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillHPL] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillHLL] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillLPH] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillLHH] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillLS] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillS] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillD] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillSPP] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillSP] = {}
Hero20007_Config.skillHitComboAI[Hero20007_Define.SkillType.SkillOP] = {}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillHPL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillHLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillLPH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillLHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillLS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillSPP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillRotationTypeAI[Hero20007_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillHPL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillHLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillLPH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillLHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillLS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillSPP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillLayer[Hero20007_Define.SkillType.SkillOP] = {
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillHPL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillHLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillLPH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillLHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillLS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillS] = {
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillSPP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20007_Config.skillRecoveryLayer[Hero20007_Define.SkillType.SkillOP] = {
	"BaseLayer"
}
Hero20007_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Super
Hero20007_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Super
Hero20007_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Super
Hero20007_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Super

return Hero20007_Config
