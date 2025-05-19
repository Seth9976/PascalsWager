-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerDefine/Hero10002_Define.lua

Hero10002_Define = {}
Hero10002_Define.SkillType = {
	SkillDH = 13,
	SkillS1 = 1,
	SkillHHH2 = 4,
	SkillSP2 = 10,
	SkillLLL = 5,
	SkillSP6T = 17,
	SkillSP5T = 18,
	SkillSP4 = 8,
	SkillLH = 14,
	SkillSP1 = 11,
	SkillSP3T = 20,
	SkillSP6 = 6,
	SkillHHH1 = 3,
	SkillH3 = 31,
	SkillHP3 = 30,
	SkillHLT = 24,
	SkillSP4T = 19,
	SkillSP5 = 7,
	SkillHP1 = 2,
	SkillO = 16,
	SkillS2 = 25,
	SkillH1 = 26,
	SkillH2 = 28,
	SkillS3 = 27,
	SkillHP2 = 29,
	SkillSP1T = 22,
	SkillSP2T = 21,
	SkillDL = 12,
	SkillH4 = 32,
	SkillSP3 = 9,
	SkillLHT = 23,
	SkillHL = 15
}
Hero10002_Define.ShootSkillAll = {
	Hero10002_Define.SkillType.SkillHHH1,
	Hero10002_Define.SkillType.SkillHHH2,
	Hero10002_Define.SkillType.SkillDH,
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP5,
	Hero10002_Define.SkillType.SkillSP4,
	Hero10002_Define.SkillType.SkillSP3,
	Hero10002_Define.SkillType.SkillSP2,
	Hero10002_Define.SkillType.SkillSP1,
	Hero10002_Define.SkillType.SkillSP6T,
	Hero10002_Define.SkillType.SkillSP5T,
	Hero10002_Define.SkillType.SkillSP4T,
	Hero10002_Define.SkillType.SkillSP3T,
	Hero10002_Define.SkillType.SkillSP2T,
	Hero10002_Define.SkillType.SkillSP1T
}
Hero10002_Define.ShootSkillSP = {
	Hero10002_Define.SkillType.SkillSP6,
	Hero10002_Define.SkillType.SkillSP5,
	Hero10002_Define.SkillType.SkillSP4,
	Hero10002_Define.SkillType.SkillSP3,
	Hero10002_Define.SkillType.SkillSP2,
	Hero10002_Define.SkillType.SkillSP1,
	Hero10002_Define.SkillType.SkillSP6T,
	Hero10002_Define.SkillType.SkillSP5T,
	Hero10002_Define.SkillType.SkillSP4T,
	Hero10002_Define.SkillType.SkillSP3T,
	Hero10002_Define.SkillType.SkillSP2T,
	Hero10002_Define.SkillType.SkillSP1T
}
Hero10002_Define.BulletType = {
	Blue = 3,
	White = 1,
	Red = 2
}
Hero10002_Define.BulletTypeMax = 3
Hero10002_Define.BulletBlueSkillAdd = 2000
Hero10002_Define.BulletRedSkillAdd = 1000
Hero10002_Define.BulletColorMax = 12
Hero10002_Define.BulletBlueMax = 12
Hero10002_Define.BulletRedMax = 12
Hero10002_Define.BulletReloadMax = 6
Hero10002_Define.BulletSpeed = 50
Hero10002_Define.SanHitEnergyRecoveryDelayRate = 500
Hero10002_Define.SanHitStatusId = 10004
Hero10002_Define.SanCritStatusId = 10001
Hero10002_Define.SanCritDamageAddRate = 100
Hero10002_Define.SanItemValueSubRate = 300
Hero10002_Define.DodgeBackAngle = 30
Hero10002_Define.BulletRangeMax = 30
Hero10002_Define.HitUpUpTimeHitTime1 = 0.066
Hero10002_Define.HitUpUpTimeResetTime1 = 0.05
Hero10002_Define.HitUpUpTimeHitTime2 = 0.26
Hero10002_Define.HitUpUpTimeResetTime2 = 0
Hero10002_Define.ExecuteBackstabStatusId = 10038
Hero10002_Define.WeaponGun = 1
Hero10002_Define.BulletColorAddRateBase = 1
Hero10002_Define.CameraShakeTemplateAim = {
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0
	},
	{
		2,
		0,
		0,
		0.2,
		0,
		0,
		0
	},
	{
		4,
		-0.03,
		0.03,
		0,
		-8,
		0,
		0
	},
	{
		6,
		0.04,
		-0.02,
		-0.09,
		-6.6,
		0,
		0
	},
	{
		11,
		-0.02,
		0.02,
		-0.03,
		0,
		0,
		0
	},
	{
		20,
		0,
		0,
		0,
		0,
		0,
		0
	}
}
Hero10002_Define.ControllerShakeTemplate = {
	0.2,
	0.3,
	0,
	0,
	0,
	0
}

return Hero10002_Define
