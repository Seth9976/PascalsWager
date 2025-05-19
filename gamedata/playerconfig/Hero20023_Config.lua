-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20023_Config.lua

Hero20023_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20023_Config.animatorLayerConfig.BaseLayer = 0
Hero20023_Config.animatorLayerConfig.UpperBody = -1
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillLP] = 1
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillLLL] = 3
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillNSP] = 3
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillDefence] = 4
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillHP] = 1
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillH] = 1
Hero20023_Config.skillComboMax[Hero20023_Define.SkillType.SkillNH] = 1
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20023_Config.skillComboMax[AnimalBase_Define.SkillType.Born3] = 2
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillLP] = {
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH,
	Hero20023_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillLLL] = {
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillDefence,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH,
	Hero20023_Define.SkillType.SkillLP,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillNSP] = {
	Hero20023_Define.SkillType.SkillDefence
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillDefence] = {
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillHP] = {
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillDefence,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillH] = {
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillDefence,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillNH,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[Hero20023_Define.SkillType.SkillNH] = {
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillDefence,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero20023_Define.SkillType.SkillLP,
	Hero20023_Define.SkillType.SkillLLL,
	Hero20023_Define.SkillType.SkillNSP,
	Hero20023_Define.SkillType.SkillDefence,
	Hero20023_Define.SkillType.SkillHP,
	Hero20023_Define.SkillType.SkillH,
	Hero20023_Define.SkillType.SkillNH,
	AnimalBase_Define.SkillType.Dodge
}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20023_Config.skillComboSkill[AnimalBase_Define.SkillType.Born3] = {}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoopAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillNextType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Down
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitType[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillHitType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillTypeForAI.Chase,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20023_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillNSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillH] = {
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[Hero20023_Define.SkillType.SkillNH] = {
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20023_Config.skillColliderShape[AnimalBase_Define.SkillType.Born3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillNSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[Hero20023_Define.SkillType.SkillNH] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillTargetType[AnimalBase_Define.SkillType.Born3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillLP] = {
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillHP] = {
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillH] = {
	false
}
Hero20023_Config.skillMultiTarget[Hero20023_Define.SkillType.SkillNH] = {
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillDamageType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillBlockedEnable[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	true
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillBlockedRebound[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillLP] = {
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillHP] = {
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillH] = {
	false
}
Hero20023_Config.hitHandEnable[Hero20023_Define.SkillType.SkillNH] = {
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.hitHandEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillLP] = {
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillHP] = {
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillH] = {
	false
}
Hero20023_Config.hitHandRebound[Hero20023_Define.SkillType.SkillNH] = {
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.hitHandRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillCounterAttackedEnable[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillCounterAttackedRebound[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillLP] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillHP] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillH] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[Hero20023_Define.SkillType.SkillNH] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillDefence] = {
	true,
	true,
	true,
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillParryEnable[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillParryEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillLP] = {
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillNSP] = {
	true,
	true,
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillDefence] = {
	true,
	true,
	true,
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillHP] = {
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillH] = {
	true
}
Hero20023_Config.skillParryRebound[Hero20023_Define.SkillType.SkillNH] = {
	true
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillParryRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillLP] = {
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillNSP] = {
	false,
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillHP] = {
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillH] = {
	false
}
Hero20023_Config.skillBeatBackEnable[Hero20023_Define.SkillType.SkillNH] = {
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20023_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20023_Config.skillHitCombo[AnimalBase_Define.SkillType.Born3] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillLLL] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillNSP] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillDefence] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillHP] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillH] = {}
Hero20023_Config.skillHitComboAI[Hero20023_Define.SkillType.SkillNH] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20023_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born3] = {}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillNSP] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[Hero20023_Define.SkillType.SkillNH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[Hero20023_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillLP] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillNSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillHP] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillH] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[Hero20023_Define.SkillType.SkillNH] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20023_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20023_Config
