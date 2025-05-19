-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero10002_Config.lua

Hero10002_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero10002_Config.animatorLayerConfig.BaseLayer = 0
Hero10002_Config.animatorLayerConfig.UpperBody = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillS1] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHP1] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHHH1] = 4
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHHH2] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillLLL] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP6] = 4
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP5] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP4] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP3] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP2] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP1] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillDL] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillDH] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillLH] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHL] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillO] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP6T] = 4
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP5T] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP4T] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP3T] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP2T] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillSP1T] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillLHT] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHLT] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillS2] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillH1] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillS3] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillH2] = 1
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHP2] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillHP3] = 3
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillH3] = 2
Hero10002_Config.skillComboMax[Hero10002_Define.SkillType.SkillH4] = 2
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 2
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Throw] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.ThrowLow] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Backstab] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.Eat] = 1
Hero10002_Config.skillComboMax[AnimalBase_Define.SkillType.EatFast] = 1
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHHH1] = {
	Hero10002_Define.SkillType.SkillHHH2,
	Hero10002_Define.SkillType.SkillHL,
	Hero10002_Define.SkillType.SkillHLT,
	Hero10002_Define.SkillType.SkillHP2,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillLLL
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHHH2] = {
	Hero10002_Define.SkillType.SkillHHH2,
	Hero10002_Define.SkillType.SkillHL,
	Hero10002_Define.SkillType.SkillHLT,
	Hero10002_Define.SkillType.SkillHP2,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillLLL
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillLLL] = {
	Hero10002_Define.SkillType.SkillLLL,
	Hero10002_Define.SkillType.SkillLH,
	Hero10002_Define.SkillType.SkillLHT,
	Hero10002_Define.SkillType.SkillHP2,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillHHH2
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillDL] = {
	Hero10002_Define.SkillType.SkillHP2,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	Hero10002_Define.SkillType.SkillLH,
	Hero10002_Define.SkillType.SkillLHT,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillHHH2
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillDH] = {
	Hero10002_Define.SkillType.SkillHP2,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	Hero10002_Define.SkillType.SkillHL,
	Hero10002_Define.SkillType.SkillHLT,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillLLL
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	Hero10002_Define.SkillType.SkillDL,
	Hero10002_Define.SkillType.SkillDH,
	Hero10002_Define.SkillType.SkillHP2,
	AnimalBase_Define.SkillType.Dodge,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP6T,
	Hero10002_Define.SkillType.SkillLLL,
	Hero10002_Define.SkillType.SkillHP3
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillComboSkill[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillType.Dodge
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillNextType.SkillAndComboExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillNextType.SkillAndComboExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillNextType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.Move
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.FrontFly
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.HitType.Backstab
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Down
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillHitType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.HitType.None
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10002_Config.skillTypeForAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHHH1] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHHH2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP6] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP5] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP2] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillDL] = {
	XCube.ShapeType.Cube
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillDH] = {
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillLH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillO] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP6T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP5T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP4T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP3T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP2T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillSP1T] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillLHT] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHLT] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillS2] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillH1] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillS3] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillH2] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillHP3] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Point,
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillH3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[Hero10002_Define.SkillType.SkillH4] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Throw] = {
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.ThrowLow] = {
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Point
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Backstab] = {
	XCube.ShapeType.Cube
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.Eat] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillColliderShape[AnimalBase_Define.SkillType.EatFast] = {
	XCube.ShapeType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillAttackBoxType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP6] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP5] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP4] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillDL] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillDH] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillLH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP6T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP5T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP4T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP3T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP2T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillSP1T] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillLHT] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHLT] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillS2] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillS3] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillH2] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillHP3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillH3] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[Hero10002_Define.SkillType.SkillH4] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Throw] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.ThrowLow] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Backstab] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.Eat] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillTargetType[AnimalBase_Define.SkillType.EatFast] = {
	GameAI.SkillTargetType.None
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillLH] = {
	true,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHL] = {
	true,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillMultiTarget[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillMultiTarget[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillDamageType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.DamageType.None
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillDH] = {
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillLH] = {
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHL] = {
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHP2] = {
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillHP3] = {
	true,
	true,
	true
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillBlockedEnable[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillBlockedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillDL] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillLH] = {
	true,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHL] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHLT] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillBlockedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillDH] = {
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillLH] = {
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHL] = {
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHP2] = {
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillHP3] = {
	true,
	true,
	true
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.hitHandEnable[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.hitHandEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillDL] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillLH] = {
	true,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHL] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHLT] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.hitHandRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillDH] = {
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillLH] = {
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHL] = {
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHP2] = {
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillHP3] = {
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedEnable[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillDL] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillLH] = {
	true,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHL] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHLT] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillDL] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillLH] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHL] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillLHT] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHLT] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHHH1] = {
	true,
	true,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHHH2] = {
	true,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillDH] = {
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillLH] = {
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHL] = {
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillLHT] = {
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHP2] = {
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillHP3] = {
	true,
	true,
	true
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillParryEnable[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillParryEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillDL] = {
	true
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillLH] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHL] = {
	true,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillLHT] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHLT] = {
	true,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillParryRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillS1] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHHH1] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHHH2] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP6] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP5] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP4] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP2] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP1] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillDL] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillDH] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillLH] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHL] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillO] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP6T] = {
	false,
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP5T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP4T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP3T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP2T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillSP1T] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillLHT] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHLT] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillS2] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillH1] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillS3] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillH2] = {
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHP2] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillHP3] = {
	false,
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillH3] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[Hero10002_Define.SkillType.SkillH4] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10002_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillS1] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHP1] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHHH1] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHHH2] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillLLL] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP6] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP5] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP4] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP3] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP2] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP1] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillDL] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillDH] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillLH] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHL] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillO] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP6T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP5T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP4T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP3T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP2T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillSP1T] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillLHT] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHLT] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillS2] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillH1] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillS3] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillH2] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHP2] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillHP3] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillH3] = {}
Hero10002_Config.skillHitCombo[Hero10002_Define.SkillType.SkillH4] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Throw] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Backstab] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.Eat] = {}
Hero10002_Config.skillHitCombo[AnimalBase_Define.SkillType.EatFast] = {}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute
}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Throw] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Backstab] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.Eat] = {}
Hero10002_Config.skillHitComboAI[AnimalBase_Define.SkillType.EatFast] = {}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP6] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP5] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillDL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillDH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillLH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP6T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP5T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP4T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP3T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP2T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillSP1T] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillLHT] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHLT] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillS3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillHP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[Hero10002_Define.SkillType.SkillH4] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillS1] = {
	"UpperBody",
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHP1] = {
	"BaseLayer",
	"UpperBody",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP6] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP5] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP4] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP3] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP2] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP1] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillDL] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillDH] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillLH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillO] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP6T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP5T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP4T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP3T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP2T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillSP1T] = {
	"UpperBody",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillLHT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHLT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillS2] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillH1] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillS3] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillH2] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHP2] = {
	"UpperBody",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillHP3] = {
	"UpperBody",
	"UpperBody",
	"BaseLayer"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillH3] = {
	"UpperBody",
	"UpperBody"
}
Hero10002_Config.skillLayer[Hero10002_Define.SkillType.SkillH4] = {
	"UpperBody",
	"UpperBody"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.Eat] = {
	"UpperBody"
}
Hero10002_Config.skillLayer[AnimalBase_Define.SkillType.EatFast] = {
	"UpperBody"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillS1] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP6] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP5] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP4] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillDL] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillDH] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillLH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHL] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP6T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP5T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP4T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP3T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP2T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillSP1T] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillLHT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHLT] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillS3] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillH2] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillHP3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillH3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[Hero10002_Define.SkillType.SkillH4] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Eat] = {
	"BaseLayer"
}
Hero10002_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.EatFast] = {
	"BaseLayer"
}

return Hero10002_Config
