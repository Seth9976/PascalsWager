-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20026_Config.lua

Hero20026_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20026_Config.animatorLayerConfig.BaseLayer = 0
Hero20026_Config.animatorLayerConfig.UpperBody = -1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillLLL1] = 3
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillD1] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillH1] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillDefence1] = 4
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillLLL2] = 3
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillD2] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillDefence2] = 4
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillO] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillLLL3] = 3
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillD3] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillH3] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillDefence3] = 4
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillLLL4] = 3
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillD4] = 1
Hero20026_Config.skillComboMax[Hero20026_Define.SkillType.SkillDefence4] = 4
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Threat] = 1
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Alert] = 1
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Relax] = 1
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Born1] = 2
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Born2] = 2
Hero20026_Config.skillComboMax[AnimalBase_Define.SkillType.Born3] = 2
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillLLL1] = {
	Hero20026_Define.SkillType.SkillD2,
	Hero20026_Define.SkillType.SkillD1
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillD1] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillH1] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillDefence1] = {
	Hero20026_Define.SkillType.SkillLLL1
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillLLL2] = {
	Hero20026_Define.SkillType.SkillD1,
	Hero20026_Define.SkillType.SkillD2
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillD2] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillDefence2] = {
	Hero20026_Define.SkillType.SkillLLL2
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillO] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillLLL3] = {
	Hero20026_Define.SkillType.SkillD4,
	Hero20026_Define.SkillType.SkillD3
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillD3] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillH3] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillDefence3] = {
	Hero20026_Define.SkillType.SkillLLL3
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillLLL4] = {
	Hero20026_Define.SkillType.SkillD3,
	Hero20026_Define.SkillType.SkillD4
}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillD4] = {}
Hero20026_Config.skillComboSkill[Hero20026_Define.SkillType.SkillDefence4] = {
	Hero20026_Define.SkillType.SkillLLL4
}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Threat] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Alert] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Relax] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Born1] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Born2] = {}
Hero20026_Config.skillComboSkill[AnimalBase_Define.SkillType.Born3] = {}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillNextType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.Down
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.HitType.Down
}
Hero20026_Config.skillHitType[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillHitType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillTypeForAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillD1] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillH1] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillDefence1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillD2] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillDefence2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillO] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillLLL3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillD3] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillH3] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillDefence3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillLLL4] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillD4] = {
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[Hero20026_Define.SkillType.SkillDefence4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Threat] = {
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Alert] = {
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Relax] = {
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Born1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Born2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillColliderShape[AnimalBase_Define.SkillType.Born3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillD1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillDefence1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillD2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillDefence2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillLLL3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillD3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillH3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillDefence3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillLLL4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillD4] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[Hero20026_Define.SkillType.SkillDefence4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Threat] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Alert] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Relax] = {
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Born1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Born2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillTargetType[AnimalBase_Define.SkillType.Born3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillMultiTarget[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillMultiTarget[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillDamageType[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillBlockedEnable[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillD3] = {
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillH3] = {
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillLLL4] = {
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillD4] = {
	false
}
Hero20026_Config.skillBlockedRebound[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillD1] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillH1] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillD2] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillD3] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillH3] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillLLL4] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillD4] = {
	false
}
Hero20026_Config.hitHandEnable[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.hitHandEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillD1] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillH1] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillD2] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillD3] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillH3] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillLLL4] = {
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillD4] = {
	false
}
Hero20026_Config.hitHandRebound[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.hitHandRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillCounterAttackedEnable[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillCounterAttackedRebound[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillD1] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillH1] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillD2] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillD3] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillH3] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillLLL4] = {
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillD4] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillParryEnable[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillParryEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillLLL1] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillD1] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillH1] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillD2] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillLLL3] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillD3] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillH3] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillLLL4] = {
	true,
	true,
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillD4] = {
	true
}
Hero20026_Config.skillParryRebound[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillParryRebound[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillLLL1] = {
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillD1] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillH1] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillDefence1] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillD2] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillDefence2] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillO] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillLLL3] = {
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillD3] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillH3] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillDefence3] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillLLL4] = {
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillD4] = {
	false
}
Hero20026_Config.skillBeatBackEnable[Hero20026_Define.SkillType.SkillDefence4] = {
	false,
	false,
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Threat] = {
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Alert] = {
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Relax] = {
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born1] = {
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born2] = {
	false,
	false
}
Hero20026_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Born3] = {
	false,
	false
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Threat] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Alert] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Relax] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Born1] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Born2] = {}
Hero20026_Config.skillHitCombo[AnimalBase_Define.SkillType.Born3] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillLLL1] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillD1] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillH1] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillDefence1] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillLLL2] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillD2] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillDefence2] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillLLL3] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillD3] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillH3] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillDefence3] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillLLL4] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillD4] = {}
Hero20026_Config.skillHitComboAI[Hero20026_Define.SkillType.SkillDefence4] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Threat] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Alert] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Relax] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born1] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born2] = {}
Hero20026_Config.skillHitComboAI[AnimalBase_Define.SkillType.Born3] = {}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillD1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillDefence1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillD2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillDefence2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillLLL3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillD3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillDefence3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillLLL4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillD4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[Hero20026_Define.SkillType.SkillDefence4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Threat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Alert] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Relax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Born3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillD1] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillDefence1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillDefence2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillLLL3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillD3] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillH3] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillDefence3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillLLL4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillD4] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[Hero20026_Define.SkillType.SkillDefence4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillD1] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillDefence1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillD2] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillDefence2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillLLL3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillD3] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillH3] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillDefence3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillLLL4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillD4] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[Hero20026_Define.SkillType.SkillDefence4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Threat] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Alert] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Relax] = {
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20026_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Born3] = {
	"BaseLayer",
	"BaseLayer"
}

return Hero20026_Config
