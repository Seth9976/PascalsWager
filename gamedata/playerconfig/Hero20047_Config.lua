-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20047_Config.lua

Hero20047_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20047_Config.animatorLayerConfig.BaseLayer = 0
Hero20047_Config.animatorLayerConfig.UpperBody = -1
Hero20047_Config.skillComboMax[Hero20047_Define.SkillType.SkillLP] = 3
Hero20047_Config.skillComboSkill[Hero20047_Define.SkillType.SkillLP] = {}
Hero20047_Config.skillNextType[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20047_Config.skillMoveTypeList[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20047_Config.skillRecoveryMoveTypeList[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20047_Config.skillHitType[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20047_Config.skillTypeForAI[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20047_Config.skillColliderShape[Hero20047_Define.SkillType.SkillLP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20047_Config.skillAttackBoxType[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20047_Config.skillTargetType[Hero20047_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20047_Config.skillMultiTarget[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillDamageType[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.None
}
Hero20047_Config.skillBlockedEnable[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillBlockedRebound[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.hitHandEnable[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.hitHandRebound[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillCounterAttackedEnable[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillCounterAttackedRebound[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillCounterAttackedKeep[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillParryEnable[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillParryRebound[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillBeatBackEnable[Hero20047_Define.SkillType.SkillLP] = {
	false,
	false,
	false
}
Hero20047_Config.skillHitCombo[Hero20047_Define.SkillType.SkillLP] = {}
Hero20047_Config.skillHitComboAI[Hero20047_Define.SkillType.SkillLP] = {}
Hero20047_Config.skillRotationTypeAI[Hero20047_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20047_Config.skillLayer[Hero20047_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20047_Config.skillRecoveryLayer[Hero20047_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}

return Hero20047_Config
