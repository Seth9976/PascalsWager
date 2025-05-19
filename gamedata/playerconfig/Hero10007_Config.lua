-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero10007_Config.lua

Hero10007_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero10007_Config.animatorLayerConfig.BaseLayer = 0
Hero10007_Config.animatorLayerConfig.UpperBody = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLLLL1] = 5
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLP1Up] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHHHH1] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillXL1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillDL1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHP1] = 3
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillSSS2] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLP2Up] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLLLLL2] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLH2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHHHHH2] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHL2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillDL2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHL1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLH1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillS1] = 4
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillAutoDefence1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHP2] = 3
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillAutoDodge2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLLLLL2Up1] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHHHHH2Up1] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLLLLL2Up2] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHHHHH2Up2] = 6
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillSL1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillSL2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillS2_1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillS2_2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLP1] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLP2] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillLH2Up] = 1
Hero10007_Config.skillComboMax[Hero10007_Define.SkillType.SkillHL2Up] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.DodgeSpecial] = 3
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Dodge] = 5
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Throw] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.ThrowLow] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.CounterAttack] = 2
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Backstab] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Execute] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Drop] = 2
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.Eat] = 1
Hero10007_Config.skillComboMax[AnimalBase_Define.SkillType.EatFast] = 1
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillLH1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillLLLL1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHL1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillHP1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillHHHH1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillLH1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillS1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillLH1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillS1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHP1] = {}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillSSS2] = {
	Hero10007_Define.SkillType.SkillS2_1,
	Hero10007_Define.SkillType.SkillS2_2,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLH2,
	Hero10007_Define.SkillType.SkillSSS2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillLH2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillHL2,
	Hero10007_Define.SkillType.SkillHL2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHL2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillHL2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLH2,
	Hero10007_Define.SkillType.SkillLH2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillLH2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillLH1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillHL1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillSL1,
	Hero10007_Define.SkillType.SkillSL2,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillHP1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHP2] = {}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10007_Define.SkillType.SkillAutoDodge2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLH2,
	Hero10007_Define.SkillType.SkillSSS2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillLH2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHL2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHL2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillLH2,
	Hero10007_Define.SkillType.SkillSSS2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillLH2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillHL2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillHL2Up
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillHP1,
	Hero10007_Define.SkillType.SkillS1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillXL1,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillHP1,
	Hero10007_Define.SkillType.SkillS1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillS2_1] = {
	Hero10007_Define.SkillType.SkillS2_2,
	Hero10007_Define.SkillType.SkillLLLL1,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillS2_2] = {
	Hero10007_Define.SkillType.SkillLLLL1,
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLP2Up,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2Up2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillHL2
}
Hero10007_Config.skillComboSkill[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillLH2
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillType.Dodge,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillDL1,
	Hero10007_Define.SkillType.SkillDL2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillSSS2,
	Hero10007_Define.SkillType.SkillHP1,
	Hero10007_Define.SkillType.SkillHP2
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillDL1,
	Hero10007_Define.SkillType.SkillDL2,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillSSS2,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillHP2,
	Hero10007_Define.SkillType.SkillHP1,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillLP1,
	Hero10007_Define.SkillType.SkillLP2,
	Hero10007_Define.SkillType.SkillLP1Up,
	Hero10007_Define.SkillType.SkillLP2Up
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1,
	Hero10007_Define.SkillType.SkillLLLL1,
	Hero10007_Define.SkillType.SkillHHHH1,
	Hero10007_Define.SkillType.SkillS1,
	Hero10007_Define.SkillType.SkillLLLLL2Up1,
	Hero10007_Define.SkillType.SkillLLLLL2,
	Hero10007_Define.SkillType.SkillLLLLL2Up2,
	Hero10007_Define.SkillType.SkillHHHHH2,
	Hero10007_Define.SkillType.SkillHHHHH2Up1,
	Hero10007_Define.SkillType.SkillHHHHH2Up2,
	Hero10007_Define.SkillType.SkillSSS2
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillComboSkill[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillType.Dodge,
	AnimalBase_Define.SkillType.DodgeSpecial,
	Hero10007_Define.SkillType.SkillAutoDodge2,
	Hero10007_Define.SkillType.SkillAutoDefence1
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillNextType.SkillAndJump,
	AnimalBase_Define.SkillNextType.SkillLoop,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.Skill,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndComboExit,
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndComboExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillNextType.SkillAndExit,
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillNextType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillNextType.SkillAndExit
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.SpecialMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.Move
}
Hero10007_Config.skillMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.Move
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.MoveType.DontMove,
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillRecoveryMoveTypeList[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.MoveType.DontMove
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.HitType.Up
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak,
	AnimalBase_Define.HitType.DefenceBreak
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.HitType.DefenceBreak
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.HitType.None
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None,
	AnimalBase_Define.HitType.None
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.HitType.Light
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.StatusBreak,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.HitType.Backstab
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.HitType.Execute
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Down
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.HitType.None
}
Hero10007_Config.skillHitType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.HitType.None
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillTypeForAI.Defence,
	AnimalBase_Define.SkillTypeForAI.DefenceLoop,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.DefenceHit
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.SkillTypeForAI.DefenceLoop
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None,
	AnimalBase_Define.SkillTypeForAI.None
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillTypeForAI.OffenseFar
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillTypeForAI.OffenseClose,
	AnimalBase_Define.SkillTypeForAI.OffenseClose
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10007_Config.skillTypeForAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillTypeForAI.Heal
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLLLL1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLP1Up] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHHHH1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillXL1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillDL1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHP1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillSSS2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLP2Up] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLLLLL2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLH2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHHHHH2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHL2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillDL2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHL1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLH1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillS1] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHP2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.None,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillSL1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillSL2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillS2_1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillS2_2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLP1] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLP2] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillLH2Up] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[Hero10007_Define.SkillType.SkillHL2Up] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.DodgeSpecial] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Dodge] = {
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None,
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Throw] = {
	XCube.ShapeType.Point
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.ThrowLow] = {
	XCube.ShapeType.Point
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.CounterAttack] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Backstab] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Execute] = {
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Drop] = {
	XCube.ShapeType.Cube,
	XCube.ShapeType.Cube
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.Eat] = {
	XCube.ShapeType.None
}
Hero10007_Config.skillColliderShape[AnimalBase_Define.SkillType.EatFast] = {
	XCube.ShapeType.None
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None,
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.AttackBoxType.Hand,
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.AttackBoxType.Hand
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.AttackBoxType.Skill,
	AnimalBase_Define.AttackBoxType.Skill
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillAttackBoxType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.AttackBoxType.None
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLLLL1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLP1Up] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHHHH1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillXL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillDL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHP1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillSSS2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLP2Up] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLLLLL2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLH2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHHHHH2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHL2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillDL2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLH1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillS1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHP2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillSL1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillSL2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillS2_1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillS2_2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLP1] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLP2] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillLH2Up] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[Hero10007_Define.SkillType.SkillHL2Up] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Dodge] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Throw] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.ThrowLow] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.CounterAttack] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Backstab] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Execute] = {
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Drop] = {
	GameAI.SkillTargetType.Enemy,
	GameAI.SkillTargetType.Enemy
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.Eat] = {
	GameAI.SkillTargetType.None
}
Hero10007_Config.skillTargetType[AnimalBase_Define.SkillType.EatFast] = {
	GameAI.SkillTargetType.None
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	false,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillMultiTarget[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Drop] = {
	true,
	true
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillMultiTarget[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None,
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.DamageType.Instant,
	AnimalBase_Define.DamageType.Instant
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillDamageType[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.DamageType.None
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillS1] = {
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillBlockedEnable[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	true,
	true
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillBlockedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillS1] = {
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillBlockedRebound[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillBlockedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillS1] = {
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.hitHandEnable[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.hitHandEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.hitHandRebound[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.hitHandRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillCounterAttackedEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillCounterAttackedRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLP1Up] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHHHH1] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillXL1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillDL1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLP2Up] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLLLLL2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLH2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHHHHH2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHL2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillDL2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHL1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLH1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillSL1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillSL2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillS2_1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillS2_2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLP1] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLP2] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillLH2Up] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[Hero10007_Define.SkillType.SkillHL2Up] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillCounterAttackedKeep[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillParryEnable[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillParryEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLLLL1] = {
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillXL1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillDL1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHP1] = {
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillSSS2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLLLLL2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillDL2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHP2] = {
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	true,
	true,
	true,
	true,
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillSL1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillSL2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillS2_1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillS2_2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillParryRebound[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Dodge] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Throw] = {
	true
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.ThrowLow] = {
	true
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.CounterAttack] = {
	true,
	true
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillParryRebound[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLLLL1] = {
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLP1Up] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHHHH1] = {
	true,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillXL1] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillDL1] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHP1] = {
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillSSS2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLP2Up] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLLLLL2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLH2] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHHHHH2] = {
	true,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHL2] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillDL2] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHL1] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLH1] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillS1] = {
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHP2] = {
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	true,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	false,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	true,
	false,
	false,
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillSL1] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillSL2] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillS2_1] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillS2_2] = {
	false
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLP1] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLP2] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillLH2Up] = {
	true
}
Hero10007_Config.skillBeatBackEnable[Hero10007_Define.SkillType.SkillHL2Up] = {
	true
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.DodgeSpecial] = {
	false,
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Dodge] = {
	true,
	true,
	false,
	true,
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Throw] = {
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.ThrowLow] = {
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.CounterAttack] = {
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Backstab] = {
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Execute] = {
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Drop] = {
	false,
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.Eat] = {
	false
}
Hero10007_Config.skillBeatBackEnable[AnimalBase_Define.SkillType.EatFast] = {
	false
}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLLLL1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLP1Up] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHHHH1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillXL1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillDL1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHP1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillSSS2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLP2Up] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLLLLL2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLH2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHHHHH2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHL2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillDL2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHL1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLH1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHP2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillSL1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillSL2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillS2_1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillS2_2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLP1] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLP2] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillLH2Up] = {}
Hero10007_Config.skillHitCombo[Hero10007_Define.SkillType.SkillHL2Up] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Throw] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.CounterAttack] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Backstab] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Execute] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Drop] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.Eat] = {}
Hero10007_Config.skillHitCombo[AnimalBase_Define.SkillType.EatFast] = {}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Backstab,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy,
	AnimalBase_Define.HitType.Up,
	AnimalBase_Define.HitType.Down,
	AnimalBase_Define.HitType.FrontFly,
	AnimalBase_Define.HitType.BackFly,
	AnimalBase_Define.HitType.Execute,
	AnimalBase_Define.HitType.Backstab
}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Throw] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.ThrowLow] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.HitType.Light,
	AnimalBase_Define.HitType.Heavy
}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Backstab] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Execute] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Drop] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.Eat] = {}
Hero10007_Config.skillHitComboAI[AnimalBase_Define.SkillType.EatFast] = {}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLLLL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLP1Up] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHHHH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillXL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillDL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillSSS2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLP2Up] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLLLLL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHHHHH2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillDL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLH1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillS1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillSL1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillSL2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillS2_1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillS2_2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLP1] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLP2] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillLH2Up] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[Hero10007_Define.SkillType.SkillHL2Up] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.DodgeSpecial] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Dodge] = {
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay,
	AnimalBase_Define.SkillRotTypeAI.Stay
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Throw] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.ThrowLow] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.CounterAttack] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Backstab] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Execute] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Drop] = {
	AnimalBase_Define.SkillRotTypeAI.Normal,
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.Eat] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillRotationTypeAI[AnimalBase_Define.SkillType.EatFast] = {
	AnimalBase_Define.SkillRotTypeAI.Normal
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLP1Up] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillXL1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillDL1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillSSS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLP2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLLLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLH2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHL2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillDL2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHL1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLH1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillS1] = {
	"UpperBody",
	"UpperBody",
	"UpperBody",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillSL1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillSL2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillS2_1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillS2_2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillLH2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[Hero10007_Define.SkillType.SkillHL2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.DodgeSpecial] = {
	"BaseLayer",
	"UpperBody",
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.Eat] = {
	"UpperBody"
}
Hero10007_Config.skillLayer[AnimalBase_Define.SkillType.EatFast] = {
	"UpperBody"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLLLL1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLP1Up] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHHHH1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillXL1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillDL1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHP1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillSSS2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLP2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLLLLL2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLH2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHHHHH2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHL2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillDL2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHL1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLH1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillS1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillAutoDefence1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHP2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillAutoDodge2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLLLLL2Up1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHHHHH2Up1] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLLLLL2Up2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHHHHH2Up2] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillSL1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillSL2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillS2_1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillS2_2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLP1] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLP2] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillLH2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[Hero10007_Define.SkillType.SkillHL2Up] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.DodgeSpecial] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Dodge] = {
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Throw] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.ThrowLow] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.CounterAttack] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Backstab] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Execute] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Drop] = {
	"BaseLayer",
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.Eat] = {
	"BaseLayer"
}
Hero10007_Config.skillRecoveryLayer[AnimalBase_Define.SkillType.EatFast] = {
	"BaseLayer"
}

return Hero10007_Config
