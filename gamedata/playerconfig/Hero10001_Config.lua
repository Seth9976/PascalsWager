-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero10001_Config.lua

Hero10001_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero10001_Config.animatorLayerConfig.BaseLayer = 0
Hero10001_Config.animatorLayerConfig.UpperBody = 1
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillLLL] = 3
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHPP] = 2
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHP] = 2
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHHH1] = 4
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHHH2] = 3
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillLHMax] = 2
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillLH] = 1
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHLMax] = 2
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHL] = 1
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillDH] = 1
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillDefence] = 4
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillLHT] = 1
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHPPT] = 2
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillLLL2] = 3
Hero10001_Config.skillComboMax[Hero10001_Define.SkillType.SkillHHH3] = 3
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.DodgeSpecial] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 2
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Throw] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.ThrowLow] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 2
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Backstab] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.Eat] = 1
Hero10001_Config.skillComboMax[AnimalBase_Define.SkillType.EatFast] = 1
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillLLL] = {
	Hero10001_Define.SkillType.SkillLLL,
	Hero10001_Define.SkillType.SkillHHH3,
	Hero10001_Define.SkillType.SkillLHT,
	Hero10001_Define.SkillType.SkillLH,
	Hero10001_Define.SkillType.SkillLHMax,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHPP] = {}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHHH1] = {
	Hero10001_Define.SkillType.SkillHHH2,
	Hero10001_Define.SkillType.SkillLLL2,
	Hero10001_Define.SkillType.SkillHL,
	Hero10001_Define.SkillType.SkillHLMax,
	Hero10001_Define.SkillType.SkillHPPT,
	Hero10001_Define.SkillType.SkillHPP,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHHH2] = {
	Hero10001_Define.SkillType.SkillHHH2,
	Hero10001_Define.SkillType.SkillLLL2,
	Hero10001_Define.SkillType.SkillHL,
	Hero10001_Define.SkillType.SkillHLMax,
	Hero10001_Define.SkillType.SkillHPPT,
	Hero10001_Define.SkillType.SkillHPP,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillDH] = {
	Hero10001_Define.SkillType.SkillDefence,
	Hero10001_Define.SkillType.SkillHL,
	Hero10001_Define.SkillType.SkillHLMax,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10001_Define.SkillType.SkillLLL2
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10001_Define.SkillType.SkillLLL
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHPPT] = {}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillLLL2] = {
	Hero10001_Define.SkillType.SkillLLL,
	Hero10001_Define.SkillType.SkillLHT,
	Hero10001_Define.SkillType.SkillLH,
	Hero10001_Define.SkillType.SkillLHMax,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[Hero10001_Define.SkillType.SkillHHH3] = {
	Hero10001_Define.SkillType.SkillHHH2,
	Hero10001_Define.SkillType.SkillHL,
	Hero10001_Define.SkillType.SkillHLMax,
	Hero10001_Define.SkillType.SkillHPPT,
	Hero10001_Define.SkillType.SkillHPP,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.DodgeSpecial] = {
	Hero10001_Define.SkillType.SkillDH,
	Hero10001_Define.SkillType.SkillLLL,
	Hero10001_Define.SkillType.SkillHPPT,
	Hero10001_Define.SkillType.SkillHPP,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.DodgeSpecial
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero10001_Define.SkillType.SkillDH,
	Hero10001_Define.SkillType.SkillLLL,
	Hero10001_Define.SkillType.SkillHPPT,
	Hero10001_Define.SkillType.SkillHPP,
	Hero10001_Define.SkillType.SkillDefence,
	AnimalBase_Define.SkillType.Dodge,
	Hero10001_Define.SkillType.SkillHHH2
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillComboSkill[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillRecovery
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillRecovery
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillNextType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.Move
}
Hero10001_Config.skillMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.Move
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Up
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Down
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Up
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10001_Config.skillHitType[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.None
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.HitType.Light
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.HitType.Light
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.HitType.Backstab
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Down
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.HitType.None
}
Hero10001_Config.skillHitType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.HitType.None
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10001_Config.skillTypeForAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHPP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillLHMax] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillLH] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHLMax] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHL] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillDH] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillDefence] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillLHT] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHPPT] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[Hero10001_Define.SkillType.SkillHHH3] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.DodgeSpecial] = {
	XCube.ShapeType.None
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Throw] = {
	XCube.ShapeType.Point
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.ThrowLow] = {
	XCube.ShapeType.Point
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Backstab] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.Eat] = {
	XCube.ShapeType.None
}
Hero10001_Config.skillColliderShape[AnimalBase_Define.SkillType.EatFast] = {
	XCube.ShapeType.None
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10001_Config.skillAttackBoxType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHPP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillLHMax] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillLH] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHLMax] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHL] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillDH] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillDefence] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillLHT] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHPPT] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[Hero10001_Define.SkillType.SkillHHH3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	GameAI.SkillTargetType.None
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Throw] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.ThrowLow] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Backstab] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.Eat] = {
	GameAI.SkillTargetType.None
}
Hero10001_Config.skillTargetType[AnimalBase_Define.SkillType.EatFast] = {
	GameAI.SkillTargetType.None
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillLHMax] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHLMax] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillMultiTarget[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillMultiTarget[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.DamageType.None
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.DamageType.None
}
Hero10001_Config.skillDamageType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.DamageType.None
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedEnable[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillBlockedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedRebound[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillBlockedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandEnable[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.hitHandEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandRebound[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.hitHandRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillLHMax] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHLMax] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillLHMax] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHLMax] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHPP] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillLH] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHL] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillDH] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillLHT] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHPPT] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[Hero10001_Define.SkillType.SkillHHH3] = {
	false,
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillLHMax] = {
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHLMax] = {
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryEnable[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillParryEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHPP] = {
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHP] = {
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillLHMax] = {
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillLH] = {
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHLMax] = {
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHL] = {
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillDH] = {
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillLHT] = {
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHPPT] = {
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillLLL2] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryRebound[Hero10001_Define.SkillType.SkillHHH3] = {
	true,
	true,
	true
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillParryRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHPP] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHP] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillLHMax] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillLH] = {
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHLMax] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHL] = {
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillDH] = {
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillDefence] = {
	false,
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillLHT] = {
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHPPT] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillLLL2] = {
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[Hero10001_Define.SkillType.SkillHHH3] = {
	false,
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10001_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillLLL] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHPP] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHP] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHHH1] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHHH2] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillLHMax] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillLH] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHLMax] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHL] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillDH] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillLHT] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHPPT] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillLLL2] = {}
Hero10001_Config.skillHitCombo[Hero10001_Define.SkillType.SkillHHH3] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Throw] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Backstab] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.Eat] = {}
Hero10001_Config.skillHitCombo[AnimalBase_Define.SkillType.EatFast] = {}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Throw] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Backstab] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.Eat] = {}
Hero10001_Config.skillHitComboAI[AnimalBase_Define.SkillType.EatFast] = {}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHPP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillLHMax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHLMax] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillDefence] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHPPT] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[Hero10001_Define.SkillType.SkillHHH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHPP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillLHMax] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillLH] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHLMax] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHL] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillDH] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillDefence] = {
	"UpperBody",
	"UpperBody",
	"UpperBody",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillLHT] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHPPT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[Hero10001_Define.SkillType.SkillHHH3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.DodgeSpecial] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.Eat] = {
	"UpperBody"
}
Hero10001_Config.skillLayer[AnimalBase_Define.SkillType.EatFast] = {
	"UpperBody"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHPP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillLHMax] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillLH] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHLMax] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHL] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillDH] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillDefence] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillLHT] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHPPT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[Hero10001_Define.SkillType.SkillHHH3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.DodgeSpecial] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Eat] = {
	"BaseLayer"
}
Hero10001_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.EatFast] = {
	"BaseLayer"
}

return Hero10001_Config
