-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerDefine/Hero20007_Define.lua

Hero20007_Define = {}
Hero20007_Define.SkillType = {
	SkillD = 7,
	SkillSPP = 8,
	SkillHLL = 2,
	SkillLHH = 4,
	SkillSP = 9,
	SkillOP = 10,
	SkillS = 6,
	SkillLS = 5,
	SkillLPH = 3,
	SkillHPL = 1
}
Hero20007_Define.BulletBlockLayerMask = LayerMask.GetMask("WallOpaque", "WallInvisible")
Hero20007_Define.SkillHSBulletSpeedY = 8
Hero20007_Define.SkillHSBulletSpeedZ = 18
Hero20007_Define.SkillHSBulletGravity = -18
Hero20007_Define.SkillLSBulletSpeedY = 7
Hero20007_Define.SkillLSBulletSpeedZ = 17
Hero20007_Define.SkillLSBulletGravity = -15
Hero20007_Define.BulletRangeMax = 15

return Hero20007_Define
