-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero90003_Config.lua

Hero90003_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero90003_Config.animatorLayerConfig.BaseLayer = 0
Hero90003_Config.animatorLayerConfig.UpperBody = -1
Hero90003_Config.skillComboMax[Hero90003_Define.SkillType.SkillL] = 2
Hero90003_Config.skillComboSkill[Hero90003_Define.SkillType.SkillL] = {}
Hero90003_Config.skillNextType[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero90003_Config.skillMoveTypeList[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero90003_Config.skillRecoveryMoveTypeList[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero90003_Config.skillHitType[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero90003_Config.skillTypeForAI[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero90003_Config.skillColliderShape[Hero90003_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero90003_Config.skillAttackBoxType[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero90003_Config.skillTargetType[Hero90003_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero90003_Config.skillMultiTarget[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillDamageType[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero90003_Config.skillBlockedEnable[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillBlockedRebound[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.hitHandEnable[Hero90003_Define.SkillType.SkillL] = {
	true,
	true
}
Hero90003_Config.hitHandRebound[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillCounterAttackedEnable[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillCounterAttackedRebound[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillCounterAttackedKeep[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillParryEnable[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillParryRebound[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillBeatBackEnable[Hero90003_Define.SkillType.SkillL] = {
	false,
	false
}
Hero90003_Config.skillHitCombo[Hero90003_Define.SkillType.SkillL] = {}
Hero90003_Config.skillHitComboAI[Hero90003_Define.SkillType.SkillL] = {}
Hero90003_Config.skillRotationTypeAI[Hero90003_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero90003_Config.skillLayer[Hero90003_Define.SkillType.SkillL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero90003_Config.skillRecoveryLayer[Hero90003_Define.SkillType.SkillL] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero90003_Config
