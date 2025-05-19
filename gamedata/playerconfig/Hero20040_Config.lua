-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero20040_Config.lua

Hero20040_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero20040_Config.animatorLayerConfig.BaseLayer = 0
Hero20040_Config.animatorLayerConfig.UpperBody = -1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillL] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNL] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillO] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillH1] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillHP] = 3
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillS1] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNS2] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNSP2] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillOP] = 2
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillH3] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillLLL] = 3
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillSP3] = 3
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillOOO] = 4
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNLP] = 3
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNHP] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillNOP] = 3
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillD] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillND] = 1
Hero20040_Config.skillComboMax[Hero20040_Define.SkillType.SkillDP3] = 2
Hero20040_Config.skillComboMax[AnimalBase_Define.SkillType.Backstab] = 1
Hero20040_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillL] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNL] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillO] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillH1] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillType.Execute
}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillS1] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNS2] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNSP2] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillOP] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillH3] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillLLL] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillSP3] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillOOO] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNLP] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNHP] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillNOP] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillD] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillND] = {}
Hero20040_Config.skillComboSkill[Hero20040_Define.SkillType.SkillDP3] = {}
Hero20040_Config.skillComboSkill[AnimalBase_Define.SkillType.Backstab] = {}
Hero20040_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillNextType.SkillBind,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.HitType.Down
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.HitType.FrontFly
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.HitType.FrontFlyFar
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.StatusWeak,
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.FrontFly
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.HitType.Down
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Heavy
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.Tackle,
	AnimalBase_Define.HitType.FrontFly
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.Down
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.HitType.Heavy
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero20040_Config.skillHitType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.HitType.Backstab
}
Hero20040_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Heal,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.SkillTypeForAI.Other,
	AnimalBase_Define.SkillTypeForAI.Other
}
Hero20040_Config.skillTypeForAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillL] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNL] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillO] = {
	XCube.ShapeType.Capsule
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillH1] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillHP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Capsule,
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNS2] = {
	XCube.ShapeType.Point
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNSP2] = {
	XCube.ShapeType.Point
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillOP] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillH3] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillLLL] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillSP3] = {
	XCube.ShapeType.Point,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillOOO] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNLP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNHP] = {
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillNOP] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillD] = {
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillND] = {
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[Hero20040_Define.SkillType.SkillDP3] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero20040_Config.skillColliderShape[AnimalBase_Define.SkillType.Backstab] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero20040_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNL] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillO] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillHP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNS2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNSP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillH3] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillLLL] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillSP3] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillOOO] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNLP] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.Self,
	GameAI.SkillTargetType.None
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNHP] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillNOP] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillD] = {
	GameAI.SkillTargetType.None
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillND] = {
	GameAI.SkillTargetType.None
}
Hero20040_Config.skillTargetType[Hero20040_Define.SkillType.SkillDP3] = {
	GameAI.SkillTargetType.None,
	GameAI.SkillTargetType.None
}
Hero20040_Config.skillTargetType[AnimalBase_Define.SkillType.Backstab] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillH1] = {
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillHP] = {
	false,
	true,
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	true,
	true,
	true
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillMultiTarget[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillMultiTarget[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Period,
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero20040_Config.skillDamageType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillO] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillH1] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNS2] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNSP2] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillOOO] = {
	true,
	true,
	true,
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNHP] = {
	true
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillBlockedEnable[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillL] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNL] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillH3] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillBlockedRebound[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillL] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNL] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillH3] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.hitHandEnable[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.hitHandEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillL] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNL] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillH3] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.hitHandRebound[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.hitHandRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillO] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillH1] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNS2] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNSP2] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillOP] = {
	true,
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillSP3] = {
	true,
	true,
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillOOO] = {
	true,
	true,
	true,
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNHP] = {
	true
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillCounterAttackedEnable[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillO] = {
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillH1] = {
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillSP3] = {
	true,
	true,
	true
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillL] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNL] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillH3] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillSP3] = {
	true,
	true,
	true
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillParryEnable[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillParryEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillL] = {
	true
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNL] = {
	true
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillH3] = {
	true
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillLLL] = {
	true,
	true,
	true
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillSP3] = {
	true,
	true,
	true
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillParryRebound[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillParryRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillL] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNL] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillO] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillH1] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillHP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillS1] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNS2] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNSP2] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillOP] = {
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillH3] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillLLL] = {
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillSP3] = {
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillOOO] = {
	false,
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNLP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNHP] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillNOP] = {
	false,
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillD] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillND] = {
	false
}
Hero20040_Config.skillBeatBackEnable[Hero20040_Define.SkillType.SkillDP3] = {
	false,
	false
}
Hero20040_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero20040_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillL] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNL] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillO] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillH1] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillHP] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillS1] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNS2] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNSP2] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillOP] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillH3] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillLLL] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillSP3] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillOOO] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNLP] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNHP] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillNOP] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillD] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillND] = {}
Hero20040_Config.skillHitCombo[Hero20040_Define.SkillType.SkillDP3] = {}
Hero20040_Config.skillHitCombo[AnimalBase_Define.SkillType.Backstab] = {}
Hero20040_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillL] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNL] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillO] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillH1] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillHP] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillS1] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNS2] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNSP2] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillOP] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillH3] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillLLL] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillSP3] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillOOO] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNLP] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNHP] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillNOP] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillD] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillND] = {}
Hero20040_Config.skillHitComboAI[Hero20040_Define.SkillType.SkillDP3] = {}
Hero20040_Config.skillHitComboAI[AnimalBase_Define.SkillType.Backstab] = {}
Hero20040_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillO] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNSP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillOP] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillH3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillLLL] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillSP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillOOO] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNLP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNHP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillNOP] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillD] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillND] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[Hero20040_Define.SkillType.SkillDP3] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillH3] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillSP3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillOOO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillNOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[Hero20040_Define.SkillType.SkillDP3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero20040_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillL] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNL] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillO] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillH1] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillHP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillS1] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNS2] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNSP2] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillOP] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillH3] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillLLL] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillSP3] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillOOO] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNLP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNHP] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillNOP] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillD] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillND] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[Hero20040_Define.SkillType.SkillDP3] = {
	"BaseLayer",
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero20040_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero20040_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero20040_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero20040_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero20040_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero20040_Config
