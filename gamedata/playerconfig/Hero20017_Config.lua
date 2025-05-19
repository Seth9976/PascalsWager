-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20017_Config.lua

Hero20017_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20017_Config.animatorLayerConfig.BaseLayer = 0
Hero20017_Config.animatorLayerConfig.UpperBody = -1
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillLP] = 3
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillLLLL] = 4
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillHPLL] = 4
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillHHH] = 3
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillL] = 1
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillDefence] = 4
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillXLL] = 2
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillXHP] = 3
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillOOO] = 3
Hero20017_Config.skillComboMax[Hero20017_Define.SkillType.SkillOO] = 2
Hero20017_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20017_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 1
Hero20017_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20017_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20017_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 3
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20017_Define.SkillType.SkillXLL
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillLLLL] = {
	Hero20017_Define.SkillType.SkillXLL,
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20017_Define.SkillType.SkillXHP
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillHHH] = {
	Hero20017_Define.SkillType.SkillXLL,
	Hero20017_Define.SkillType.SkillXHP,
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero20017_Define.SkillType.SkillXLL,
	Hero20017_Define.SkillType.SkillXHP,
	Hero20017_Define.SkillType.SkillOO
}
Hero20017_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Down
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Light
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Down
}
Hero20017_Config.skillHitType[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Down
}
Hero20017_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20017_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20017_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20017_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20017_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20017_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20017_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20017_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20017_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillLLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillHPLL] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillHHH] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillXLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillXHP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillOOO] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[Hero20017_Define.SkillType.SkillOO] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20017_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube
}
Hero20017_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20017_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20017_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20017_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20017_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20017_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20017_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillLLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillHPLL] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillHHH] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillXLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillXHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillOOO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[Hero20017_Define.SkillType.SkillOO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20017_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillHPLL] = {
	true,
	true,
	false,
	false
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillMultiTarget[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20017_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20017_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20017_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20017_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillHPLL] = {
	true,
	true,
	true,
	false
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillHHH] = {
	true,
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillBlockedEnable[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20017_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillL] = {
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillXLL] = {
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillXHP] = {
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillOOO] = {
	false,
	false,
	false
}
Hero20017_Config.skillBlockedRebound[Hero20017_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20017_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillL] = {
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillXLL] = {
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillXHP] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillOOO] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandEnable[Hero20017_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20017_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillL] = {
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillXLL] = {
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillXHP] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillOOO] = {
	false,
	false,
	false
}
Hero20017_Config.hitHandRebound[Hero20017_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20017_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	true,
	true,
	false
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20017_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	true,
	true,
	false
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillL] = {
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillXLL] = {
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillXHP] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillOOO] = {
	false,
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[Hero20017_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20017_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	true,
	false,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryEnable[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20017_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillLP] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillLLLL] = {
	true,
	true,
	true,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	true,
	false,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillL] = {
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillXLL] = {
	true,
	false
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillXHP] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillOOO] = {
	true,
	true,
	true
}
Hero20017_Config.skillParryRebound[Hero20017_Define.SkillType.SkillOO] = {
	true,
	true
}
Hero20017_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero20017_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillLLLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillHPLL] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillHHH] = {
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillL] = {
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillXLL] = {
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillXHP] = {
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillOOO] = {
	false,
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[Hero20017_Define.SkillType.SkillOO] = {
	false,
	false
}
Hero20017_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20017_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero20017_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20017_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20017_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false,
	false,
	false
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Up
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20017_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20017_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20017_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Backstab
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.LeftHand,
	AnimalBase_Define.HitType.RightHand,
	AnimalBase_Define.HitType.StatusBreak
}
Hero20017_Config.skillHitComboAI[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20017_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.LeftHand,
	AnimalBase_Define.HitType.RightHand,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Backstab
}
Hero20017_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero20017_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20017_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20017_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillLLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillHPLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillHHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillXLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillXHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[Hero20017_Define.SkillType.SkillOO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20017_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillHPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillXLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillXHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillOOO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[Hero20017_Define.SkillType.SkillOO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20017_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20017_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20017_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20017_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillLLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillHPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillHHH] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillXLL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillXHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillOOO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[Hero20017_Define.SkillType.SkillOO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20017_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}

return Hero20017_Config
