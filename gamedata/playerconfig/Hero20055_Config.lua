-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20055_Config.lua

Hero20055_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20055_Config.animatorLayerConfig.BaseLayer = 0
Hero20055_Config.animatorLayerConfig.UpperBody = -1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillL1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillS1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNH1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNSS2] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillSP2] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillHP2] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillOP2] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillLP2] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillLL2] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillH2] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillHH3] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillLL3] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillS3] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillSP3] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillLL4] = 2
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillHP4] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillSP4] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillOP4] = 3
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillDP4] = 4
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNL1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNLP1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillND1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNDP1] = 1
Hero20055_Config.skillComboMax[Hero20055_Define.SkillType.SkillNHP1] = 1
Hero20055_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 1
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillL1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillS1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNH1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero20055_Define.SkillType.SkillSP3
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNL1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNLP1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillND1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNDP1] = {}
Hero20055_Config.skillComboSkill[Hero20055_Define.SkillType.SkillNHP1] = {}
Hero20055_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero20055_Define.SkillType.SkillSP2,
	Hero20055_Define.SkillType.SkillLP2,
	Hero20055_Define.SkillType.SkillLL2,
	Hero20055_Define.SkillType.SkillHH3,
	Hero20055_Define.SkillType.SkillLL3,
	Hero20055_Define.SkillType.SkillS3,
	Hero20055_Define.SkillType.SkillSP3,
	Hero20055_Define.SkillType.SkillLL4,
	Hero20055_Define.SkillType.SkillHP4,
	Hero20055_Define.SkillType.SkillSP4,
	Hero20055_Define.SkillType.SkillOP4,
	Hero20055_Define.SkillType.SkillL1
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoopAndRecovery,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.StatusWeak
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.HitType.Down
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Up
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.FrontFly
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillL1] = {
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNH1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNSS2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillSP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillOP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillH2] = {
	XCube.ShapeType.Point
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillHH3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillLL3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillS3] = {
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillSP3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillLL4] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillHP4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillSP4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillOP4] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillDP4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNL1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNLP1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillND1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNDP1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[Hero20055_Define.SkillType.SkillNHP1] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNSS2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillOP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillHH3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillLL3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillS3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillSP3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillLL4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillHP4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillSP4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillOP4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillDP4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillND1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNDP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[Hero20055_Define.SkillType.SkillNHP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillL1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillMultiTarget[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNSS2] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillLP2] = {
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillH2] = {
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillHH3] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillLL3] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillS3] = {
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillSP3] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillLL4] = {
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillHP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillSP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillBlockedEnable[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillBlockedRebound[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillL1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.hitHandEnable[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillL1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.hitHandRebound[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillS1] = {
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNSS2] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillLP2] = {
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillH2] = {
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillHH3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillLL3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillS3] = {
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillSP3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillLL4] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillHP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillSP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillOP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillS1] = {
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNSS2] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillLP2] = {
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillH2] = {
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillHH3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillLL3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillS3] = {
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillSP3] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillLL4] = {
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillHP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillSP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillOP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillL1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillS1] = {
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNSS2] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillSP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillOP2] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillLP2] = {
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillLL2] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillH2] = {
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillHH3] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillLL3] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillS3] = {
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillSP3] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillLL4] = {
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillHP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillSP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillOP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillParryEnable[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillL1] = {
	true
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillLP2] = {
	true
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillHH3] = {
	true,
	true
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillLL3] = {
	true,
	true
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillLL4] = {
	true,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillOP4] = {
	true,
	true,
	true
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillParryRebound[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillL1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillS1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNH1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNSS2] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillOP2] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillLP2] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillLL2] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillH2] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillHH3] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillLL3] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillS3] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillSP3] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillLL4] = {
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillHP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillOP4] = {
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillDP4] = {
	false,
	false,
	false,
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNL1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNLP1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillND1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNDP1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[Hero20055_Define.SkillType.SkillNHP1] = {
	false
}
Hero20055_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false
}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillL1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillS1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNH1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNSS2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillSP2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillHP2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillOP2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillLP2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillLL2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillH2] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillHH3] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillLL3] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillS3] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillSP3] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillLL4] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillHP4] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillSP4] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillOP4] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillDP4] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNL1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNLP1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillND1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNDP1] = {}
Hero20055_Config.skillHitCombo[Hero20055_Define.SkillType.SkillNHP1] = {}
Hero20055_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNSS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillOP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillHH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillLL3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillLL4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillHP4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillOP4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillDP4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNLP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillND1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNDP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[Hero20055_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20055_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNSS2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillHH3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillLL3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillS3] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillSP3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillLL4] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillHP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillSP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillOP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillDP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNL1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNLP1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillND1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNDP1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[Hero20055_Define.SkillType.SkillNHP1] = {
	"BaseLayer"
}
Hero20055_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillL1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNSS2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillOP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillLL2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillHH3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillLL3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillS3] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillSP3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillLL4] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillHP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillSP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillOP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillDP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNL1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNLP1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillND1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNDP1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[Hero20055_Define.SkillType.SkillNHP1] = {
	"BaseLayer"
}
Hero20055_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer"
}
Hero20055_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20055_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20055_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20055_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20055_Config
