-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20050_Config.lua

Hero20050_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20050_Config.animatorLayerConfig.BaseLayer = 0
Hero20050_Config.animatorLayerConfig.UpperBody = -1
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLLL1] = 3
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillHH1] = 2
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLP1] = 1
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillS] = 2
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillHH2] = 2
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillHP2] = 3
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLLL2] = 3
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLP2] = 1
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLLL3] = 3
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillO3] = 1
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillH3] = 4
Hero20050_Config.skillComboMax[Hero20050_Define.SkillType.SkillLP3] = 1
Hero20050_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20050_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20050_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLLL1] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillHH1] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLP1] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillS] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillHH2] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillHP2] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLLL2] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLP2] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLLL3] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillO3] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillH3] = {}
Hero20050_Config.skillComboSkill[Hero20050_Define.SkillType.SkillLP3] = {}
Hero20050_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20050_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20050_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.HitType.Light
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.PullFrontTackle,
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.FrontFly
}
Hero20050_Config.skillHitType[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.Light
}
Hero20050_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.Light
}
Hero20050_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.Light
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Pull,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLP1] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillS] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLLL3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillO3] = {
	XCube.ShapeType.Point
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillH3] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[Hero20050_Define.SkillType.SkillLP3] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.Cube
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillS] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLLL3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillO3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillH3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[Hero20050_Define.SkillType.SkillLP3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLP1] = {
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.skillMultiTarget[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillS] = {
	false,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLP2] = {
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillO3] = {
	true
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.skillBlockedEnable[Hero20050_Define.SkillType.SkillLP3] = {
	true
}
Hero20050_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.skillBlockedRebound[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLP1] = {
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.hitHandEnable[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLP1] = {
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.hitHandRebound[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillS] = {
	false,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLP2] = {
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillO3] = {
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillH3] = {
	true,
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedEnable[Hero20050_Define.SkillType.SkillLP3] = {
	true
}
Hero20050_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillS] = {
	false,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLP2] = {
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillO3] = {
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillH3] = {
	true,
	true,
	true,
	true
}
Hero20050_Config.skillCounterAttackedRebound[Hero20050_Define.SkillType.SkillLP3] = {
	true
}
Hero20050_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillHH1] = {
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLP1] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillS] = {
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.skillCounterAttackedKeep[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillS] = {
	false,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLP2] = {
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillO3] = {
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillH3] = {
	true,
	true,
	true,
	true
}
Hero20050_Config.skillParryEnable[Hero20050_Define.SkillType.SkillLP3] = {
	true
}
Hero20050_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillS] = {
	false,
	true
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillHH2] = {
	false,
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLP2] = {
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillO3] = {
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillH3] = {
	false,
	false,
	false,
	false
}
Hero20050_Config.skillParryRebound[Hero20050_Define.SkillType.SkillLP3] = {
	false
}
Hero20050_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillHH1] = {
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLP1] = {
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillS] = {
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillHH2] = {
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLP2] = {
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillO3] = {
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillH3] = {
	true,
	true,
	true,
	true
}
Hero20050_Config.skillBeatBackEnable[Hero20050_Define.SkillType.SkillLP3] = {
	true
}
Hero20050_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20050_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20050_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLLL1] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillHH1] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLP1] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillS] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillHH2] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillHP2] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLLL2] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLP2] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLLL3] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillO3] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillH3] = {}
Hero20050_Config.skillHitCombo[Hero20050_Define.SkillType.SkillLP3] = {}
Hero20050_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20050_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20050_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20050_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20050_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20050_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.TurnBack
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillO3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[Hero20050_Define.SkillType.SkillLP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillHH1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillHH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLLL3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillO3] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillH3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillLayer[Hero20050_Define.SkillType.SkillLP3] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20050_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillHH1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillS] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillHH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLLL3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillO3] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillH3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[Hero20050_Define.SkillType.SkillLP3] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20050_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}

return Hero20050_Config
