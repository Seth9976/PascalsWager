-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20003_Config.lua

Hero20003_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20003_Config.animatorLayerConfig.BaseLayer = 0
Hero20003_Config.animatorLayerConfig.UpperBody = -1
Hero20003_Config.skillComboMax[Hero20003_Define.SkillType.Sputa] = 1
Hero20003_Config.skillComboSkill[Hero20003_Define.SkillType.Sputa] = {}
Hero20003_Config.skillNextType[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20003_Config.skillMoveTypeList[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20003_Config.skillRecoveryMoveTypeList[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20003_Config.skillHitType[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.HitType.Light
}
Hero20003_Config.skillTypeForAI[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20003_Config.skillColliderShape[Hero20003_Define.SkillType.Sputa] = {
	XCube.ShapeType.Point
}
Hero20003_Config.skillAttackBoxType[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20003_Config.skillTargetType[Hero20003_Define.SkillType.Sputa] = {
	GameAI.SkillTargetType.Enemy
}
Hero20003_Config.skillMultiTarget[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.skillDamageType[Hero20003_Define.SkillType.Sputa] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20003_Config.skillBlockedEnable[Hero20003_Define.SkillType.Sputa] = {
	true
}
Hero20003_Config.skillBlockedRebound[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.hitHandEnable[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.hitHandRebound[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.skillCounterAttackedEnable[Hero20003_Define.SkillType.Sputa] = {
	true
}
Hero20003_Config.skillCounterAttackedRebound[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.skillBeatBackEnable[Hero20003_Define.SkillType.Sputa] = {
	false
}
Hero20003_Config.skillLayer[Hero20003_Define.SkillType.Sputa] = {
	"BaseLayer"
}
Hero20003_Config.skillRecoveryLayer[Hero20003_Define.SkillType.Sputa] = {
	"BaseLayer"
}

return Hero20003_Config
