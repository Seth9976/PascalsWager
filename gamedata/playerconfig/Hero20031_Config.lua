-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20031_Config.lua

Hero20031_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20031_Config.animatorLayerConfig.BaseLayer = 0
Hero20031_Config.animatorLayerConfig.UpperBody = -1
Hero20031_Config.skillComboMax[Hero20031_Define.SkillType.SkillLP] = 2
Hero20031_Config.skillComboSkill[Hero20031_Define.SkillType.SkillLP] = {}
Hero20031_Config.skillNextType[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20031_Config.skillMoveTypeList[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20031_Config.skillRecoveryMoveTypeList[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20031_Config.skillHitType[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20031_Config.skillTypeForAI[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20031_Config.skillColliderShape[Hero20031_Define.SkillType.SkillLP] = {
	XCube.ShapeType.Capsule,
	XCube.ShapeType.None
}
Hero20031_Config.skillAttackBoxType[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20031_Config.skillTargetType[Hero20031_Define.SkillType.SkillLP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20031_Config.skillMultiTarget[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillDamageType[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.None
}
Hero20031_Config.skillBlockedEnable[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillBlockedRebound[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.hitHandEnable[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.hitHandRebound[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillCounterAttackedEnable[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillCounterAttackedRebound[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillCounterAttackedKeep[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillParryEnable[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillParryRebound[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillBeatBackEnable[Hero20031_Define.SkillType.SkillLP] = {
	false,
	false
}
Hero20031_Config.skillHitCombo[Hero20031_Define.SkillType.SkillLP] = {}
Hero20031_Config.skillHitComboAI[Hero20031_Define.SkillType.SkillLP] = {}
Hero20031_Config.skillRotationTypeAI[Hero20031_Define.SkillType.SkillLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20031_Config.skillLayer[Hero20031_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20031_Config.skillRecoveryLayer[Hero20031_Define.SkillType.SkillLP] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20031_Config
