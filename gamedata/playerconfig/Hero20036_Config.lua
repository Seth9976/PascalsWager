-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20036_Config.lua

Hero20036_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20036_Config.animatorLayerConfig.BaseLayer = 0
Hero20036_Config.animatorLayerConfig.UpperBody = -1
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillLLL1] = 3
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillHP1] = 1
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillHHH1] = 3
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillO1] = 1
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillOP2] = 1
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillDefence] = 4
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillLLL2] = 3
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillHPHP2] = 2
Hero20036_Config.skillComboMax[Hero20036_Define.SkillType.SkillHHHH2] = 4
Hero20036_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20036_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20036_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20036_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20036_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillLLL1] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillHP1] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillHHH1] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillO1] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillOP2] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillDefence] = {
	Hero20036_Define.SkillType.SkillHHH1,
	Hero20036_Define.SkillType.SkillHHHH2
}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillLLL2] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillHPHP2] = {}
Hero20036_Config.skillComboSkill[Hero20036_Define.SkillType.SkillHHHH2] = {}
Hero20036_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20036_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20036_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20036_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20036_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20036_Config.skillHitType[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20036_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20036_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillO1] = {
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillOP2] = {
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillHPHP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[Hero20036_Define.SkillType.SkillHHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20036_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20036_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20036_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillOP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillHPHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[Hero20036_Define.SkillType.SkillHHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillOP2] = {
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	true
}
Hero20036_Config.skillMultiTarget[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20036_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20036_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillOP2] = {
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	true
}
Hero20036_Config.skillBlockedEnable[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20036_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	true
}
Hero20036_Config.skillBlockedRebound[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20036_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillHP1] = {
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillOP2] = {
	true
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillHPHP2] = {
	false,
	false
}
Hero20036_Config.hitHandEnable[Hero20036_Define.SkillType.SkillHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillHP1] = {
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillOP2] = {
	true
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillHPHP2] = {
	false,
	false
}
Hero20036_Config.hitHandRebound[Hero20036_Define.SkillType.SkillHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillO1] = {
	true
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillHPHP2] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[Hero20036_Define.SkillType.SkillHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	true
}
Hero20036_Config.skillCounterAttackedRebound[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	true
}
Hero20036_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillHP1] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillHPHP2] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[Hero20036_Define.SkillType.SkillHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	false
}
Hero20036_Config.skillParryEnable[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	false
}
Hero20036_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillHP1] = {
	true
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillHPHP2] = {
	true,
	false
}
Hero20036_Config.skillParryRebound[Hero20036_Define.SkillType.SkillHHHH2] = {
	true,
	true,
	true,
	false
}
Hero20036_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillHP1] = {
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillO1] = {
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillOP2] = {
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillHPHP2] = {
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[Hero20036_Define.SkillType.SkillHHHH2] = {
	false,
	false,
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20036_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20036_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20036_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20036_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillLLL1] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillHP1] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillHHH1] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillO1] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillOP2] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillDefence] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillLLL2] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillHPHP2] = {}
Hero20036_Config.skillHitCombo[Hero20036_Define.SkillType.SkillHHHH2] = {}
Hero20036_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20036_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20036_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20036_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20036_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20036_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20036_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20036_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20036_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20036_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillHPHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[Hero20036_Define.SkillType.SkillHHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillOP2] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillHPHP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[Hero20036_Define.SkillType.SkillHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20036_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillHP1] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillOP2] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillHPHP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[Hero20036_Define.SkillType.SkillHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20036_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20036_Config
