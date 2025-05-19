-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20022_Config.lua

Hero20022_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20022_Config.animatorLayerConfig.BaseLayer = 0
Hero20022_Config.animatorLayerConfig.UpperBody = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillLPLL] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillL] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillHH] = 2
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillSP] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillS1] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillS2] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNLP] = 2
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNL] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNHP1] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNHP2] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNH1] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNH2] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillD] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillOP] = 2
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillO] = 2
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNOP] = 4
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillDownShoot] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNO] = 4
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillGiantHand] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillDown] = 3
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillND] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNDP] = 1
Hero20022_Config.skillComboMax[Hero20022_Define.SkillType.SkillNS] = 1
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillLPLL] = {
	Hero20022_Define.SkillType.SkillD
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillL] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillHH] = {
	Hero20022_Define.SkillType.SkillD
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillSP] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillS1] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillS2] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNLP] = {
	Hero20022_Define.SkillType.SkillHH
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNL] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNHP1] = {
	Hero20022_Define.SkillType.SkillNHP1
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNHP2] = {
	Hero20022_Define.SkillType.SkillNHP2
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNH1] = {
	Hero20022_Define.SkillType.SkillD
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNH2] = {
	Hero20022_Define.SkillType.SkillD
}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillD] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillOP] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillO] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNOP] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillDownShoot] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNO] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillGiantHand] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillDown] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillND] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNDP] = {}
Hero20022_Config.skillComboSkill[Hero20022_Define.SkillType.SkillNS] = {
	Hero20022_Define.SkillType.SkillNH1,
	Hero20022_Define.SkillType.SkillNH2
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillNextType[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.Move
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.Move
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.Move
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move,
	AnimalBase_Define.MoveType.Move
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillMoveTypeList[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillRecoveryMoveTypeList[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Up
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Up
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.HitType.Down
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.Light
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20022_Config.skillHitType[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillTypeForAI[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillLPLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillHH] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillSP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Capsule,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillS1] = {
	XCube.ShapeType.Point
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillS2] = {
	XCube.ShapeType.Point
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNLP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNHP1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNHP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNH1] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNH2] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillD] = {
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillOP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillO] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNOP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillDownShoot] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNO] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillGiantHand] = {
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillDown] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillND] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNDP] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillColliderShape[Hero20022_Define.SkillType.SkillNS] = {
	XCube.ShapeType.Cube
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillAttackBoxType[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillLPLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillHH] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillSP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNLP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNHP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillDownShoot] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillGiantHand] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillDown] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillND] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNDP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillTargetType[Hero20022_Define.SkillType.SkillNS] = {
	GameAI.SkillTargetType.Enemy
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNL] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNHP1] = {
	true,
	true,
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNHP2] = {
	true,
	true,
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNH1] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNH2] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	true,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillDown] = {
	false,
	true,
	false
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillND] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNDP] = {
	true
}
Hero20022_Config.skillMultiTarget[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.None
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillDamageType[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillS1] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillS2] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNLP] = {
	true,
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNL] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNHP1] = {
	true,
	true,
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNHP2] = {
	true,
	true,
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNH1] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNH2] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillD] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillND] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNDP] = {
	true
}
Hero20022_Config.skillBlockedEnable[Hero20022_Define.SkillType.SkillNS] = {
	true
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillL] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.skillBlockedRebound[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillL] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.hitHandEnable[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillL] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.hitHandRebound[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillS1] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillS2] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNLP] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNL] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNHP1] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNHP2] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNH1] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNH2] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillDownShoot] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillGiantHand] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillND] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNDP] = {
	true
}
Hero20022_Config.skillCounterAttackedEnable[Hero20022_Define.SkillType.SkillNS] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillSP] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNLP] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNL] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNHP1] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNHP2] = {
	true,
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNH1] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNH2] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillO] = {
	true,
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillDownShoot] = {
	true,
	true,
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillGiantHand] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillND] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNDP] = {
	true
}
Hero20022_Config.skillCounterAttackedRebound[Hero20022_Define.SkillType.SkillNS] = {
	true
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillL] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.skillCounterAttackedKeep[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillS1] = {
	true
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillS2] = {
	true
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNLP] = {
	true,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	true,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	true,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.skillParryEnable[Hero20022_Define.SkillType.SkillNS] = {
	true
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillLPLL] = {
	true,
	true,
	true
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillL] = {
	true
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillHH] = {
	true,
	true
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNLP] = {
	true,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	true,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	true,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.skillParryRebound[Hero20022_Define.SkillType.SkillNS] = {
	true
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillLPLL] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillL] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillHH] = {
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillSP] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillS1] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillS2] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNLP] = {
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNL] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNHP1] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNHP2] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNH1] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNH2] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillD] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillO] = {
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNOP] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillDownShoot] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNO] = {
	false,
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillGiantHand] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillDown] = {
	false,
	false,
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillND] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNDP] = {
	false
}
Hero20022_Config.skillBeatBackEnable[Hero20022_Define.SkillType.SkillNS] = {
	false
}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillLPLL] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillL] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillHH] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillSP] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillS1] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillS2] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNLP] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNL] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNHP1] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNHP2] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNH1] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNH2] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillD] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillOP] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillO] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNOP] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillDownShoot] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNO] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillGiantHand] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillDown] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillND] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNDP] = {}
Hero20022_Config.skillHitCombo[Hero20022_Define.SkillType.SkillNS] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillLPLL] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillL] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillHH] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillSP] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillS1] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillS2] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNLP] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNL] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNHP1] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNHP2] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNH1] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNH2] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillD] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillOP] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillO] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNOP] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillDownShoot] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNO] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillGiantHand] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillDown] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillND] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNDP] = {}
Hero20022_Config.skillHitComboAI[Hero20022_Define.SkillType.SkillNS] = {}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillLPLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillHH] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillSP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillS2] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Chase,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillDownShoot] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNO] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillGiantHand] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillDown] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNDP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero20022_Config.skillRotationTypeAI[Hero20022_Define.SkillType.SkillNS] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillLPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillL] = {
	"UpperBody"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillHH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillSP] = {
	"UpperBody",
	"UpperBody",
	"UpperBody"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillS1] = {
	"UpperBody"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillS2] = {
	"UpperBody"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNLP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNHP1] = {
	"UpperBody",
	"UpperBody",
	"UpperBody"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNH2] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillDownShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillGiantHand] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillDown] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNDP] = {
	"BaseLayer"
}
Hero20022_Config.skillLayer[Hero20022_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillLPLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillHH] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillSP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillS2] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNLP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNHP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNH1] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNH2] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillO] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillDownShoot] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillGiantHand] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillDown] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNDP] = {
	"BaseLayer"
}
Hero20022_Config.skillRecoveryLayer[Hero20022_Define.SkillType.SkillNS] = {
	"BaseLayer"
}
Hero20022_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20022_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20022_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20022_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20022_Config
