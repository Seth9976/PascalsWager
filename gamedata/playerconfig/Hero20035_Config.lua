-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20035_Config.lua

Hero20035_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20035_Config.animatorLayerConfig.BaseLayer = 0
Hero20035_Config.animatorLayerConfig.UpperBody = -1
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillLL] = 2
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillH] = 1
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillS1] = 1
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillSP1] = 2
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillNL2] = 1
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillD2] = 1
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillNHNH2] = 2
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillNS2] = 3
Hero20035_Config.skillComboMax[Hero20035_Define.SkillType.SkillO1] = 1
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 3
Hero20035_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillLL] = {
	Hero20035_Define.SkillType.SkillS1
}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillH] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillS1] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillSP1] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillNL2] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillD2] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillNHNH2] = {
	Hero20035_Define.SkillType.SkillNL2,
	Hero20035_Define.SkillType.SkillD2
}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillNS2] = {}
Hero20035_Config.skillComboSkill[Hero20035_Define.SkillType.SkillO1] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20035_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.HitType.Down
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.Light
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.LightFreeze,
	AnimalBase_Define.HitType.PullFrontFreeze,
	AnimalBase_Define.HitType.StatusWeak
}
Hero20035_Config.skillHitType[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillTypeForAI.PullFix,
	AnimalBase_Define.SkillTypeForAI.Pull,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20035_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillS1] = {
	XCube.ShapeType.Point
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillSP1] = {
	XCube.ShapeType.Capsule,
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillNL2] = {
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillD2] = {
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillNHNH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillNS2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[Hero20035_Define.SkillType.SkillO1] = {
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20035_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillSP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillNL2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillD2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillNHNH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillNS2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[Hero20035_Define.SkillType.SkillO1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillH] = {
	false
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillS1] = {
	true
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillMultiTarget[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillS1] = {
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillBlockedEnable[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillNL2] = {
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillD2] = {
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillNHNH2] = {
	false,
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillBlockedRebound[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillH] = {
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillS1] = {
	true
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillNL2] = {
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillD2] = {
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillNHNH2] = {
	false,
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.hitHandEnable[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillH] = {
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillNL2] = {
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillD2] = {
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillNHNH2] = {
	false,
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.hitHandRebound[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillS1] = {
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillNS2] = {
	true,
	true,
	true
}
Hero20035_Config.skillCounterAttackedEnable[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillNS2] = {
	true,
	true,
	true
}
Hero20035_Config.skillCounterAttackedRebound[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillH] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillNL2] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillD2] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillNHNH2] = {
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillS1] = {
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillParryEnable[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillLL] = {
	true,
	true
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillH] = {
	true
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillNL2] = {
	true
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillD2] = {
	true
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillNHNH2] = {
	true,
	true
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillParryRebound[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillLL] = {
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillH] = {
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillS1] = {
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillSP1] = {
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillNL2] = {
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillD2] = {
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillNHNH2] = {
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillNS2] = {
	false,
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[Hero20035_Define.SkillType.SkillO1] = {
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false,
	false
}
Hero20035_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillLL] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillH] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillS1] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillSP1] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillNL2] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillD2] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillNHNH2] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillNS2] = {}
Hero20035_Config.skillHitCombo[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20035_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20035_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillNL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillNHNH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[Hero20035_Define.SkillType.SkillO1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillSP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillNL2] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillNHNH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillNS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillLayer[Hero20035_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillSP1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillNL2] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillNHNH2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillNS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[Hero20035_Define.SkillType.SkillO1] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20035_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20035_Config
