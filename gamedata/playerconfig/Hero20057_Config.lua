-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20057_Config.lua

Hero20057_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20057_Config.animatorLayerConfig.BaseLayer = 0
Hero20057_Config.animatorLayerConfig.UpperBody = -1
Hero20057_Config.skillComboMax[Hero20057_Define.SkillType.SkillL] = 1
Hero20057_Config.skillComboSkill[Hero20057_Define.SkillType.SkillL] = {}
Hero20057_Config.skillNextType[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20057_Config.skillMoveTypeList[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20057_Config.skillRecoveryMoveTypeList[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20057_Config.skillHitType[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20057_Config.skillTypeForAI[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20057_Config.skillColliderShape[Hero20057_Define.SkillType.SkillL] = {
	XCube.ShapeType.Point
}
Hero20057_Config.skillAttackBoxType[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20057_Config.skillTargetType[Hero20057_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20057_Config.skillMultiTarget[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillDamageType[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20057_Config.skillBlockedEnable[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillBlockedRebound[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.hitHandEnable[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.hitHandRebound[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillCounterAttackedEnable[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillCounterAttackedRebound[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillCounterAttackedKeep[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillParryEnable[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillParryRebound[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillBeatBackEnable[Hero20057_Define.SkillType.SkillL] = {
	false
}
Hero20057_Config.skillHitCombo[Hero20057_Define.SkillType.SkillL] = {}
Hero20057_Config.skillHitComboAI[Hero20057_Define.SkillType.SkillL] = {}
Hero20057_Config.skillRotationTypeAI[Hero20057_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20057_Config.skillLayer[Hero20057_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20057_Config.skillRecoveryLayer[Hero20057_Define.SkillType.SkillL] = {
	"BaseLayer"
}

return Hero20057_Config
