-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/AnimalBase_Value.lua

require("GameData/PlayerDefine/AnimalBase_Value_Define")

AnimalBase_Value = class("AnimalBase_Value")
AnimalBase_Value.static.PropertySkill = {
	Toughness = 1,
	DamageSub = 2
}
AnimalBase_Value.static.PropertySkillMax = 2

function AnimalBase_Value:initialize(animal)
	self.animal = animal
	self.heroId = animal:GetHeroId()
	self.storyId = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.storyId = FS_UserData.story:GetStoryId()
	end

	self.property = {}
	self.propertyMax = {}
	self.propertyMaxDiff = {}
	self.propertyMaxDiffOld = {}
	self.propertyBase = {}

	for i = 1, MS_HeroData.PropertyMax do
		self.property[i] = 0
		self.propertyMax[i] = 0
		self.propertyMaxDiff[i] = 0
		self.propertyMaxDiffOld[i] = 0
		self.propertyBase[i] = 0
	end

	self.propertySkill = {}

	for i = 1, AnimalBase_Value.PropertySkillMax do
		self.propertySkill[i] = 0
	end

	self.damageAdd = 0
	self.heroData = MS_HeroData.GetHero(self.heroId)
	self.heroSaveData = nil

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self.animal:IsHost() == true then
		self.heroSaveData = FS_UserData.heroList:GetHero(self.heroId)
	end

	self.deadFrame = 0
	self.energyRecoveryDelayTime = 0
	self.calculatePeriodTime = 0
	self.rebornFrame = 0
	self.rebornEnable = false
	self.propertyLockMin = {}

	for i = 1, MS_HeroData.PropertyMax do
		self.propertyLockMin[i] = -1
	end

	self.sanPropertyLockCrazy = false
	self.sanPropertyLockBoss = false
	self.heroPropertyData = nil
	self.sceneController = ST_Main.GetSceneController()
	self.gameController = nil
end

function AnimalBase_Value:Start()
	self.gameController = self.sceneController:GetGameController()
end

function AnimalBase_Value:SetScene(tmpScene)
	self.scene = tmpScene
end

function AnimalBase_Value:SetHeroPropertyData(data)
	self.heroPropertyData = data
end

function AnimalBase_Value:PrepareValue(lv)
	self.level = lv

	self:InitPropertyBase()

	for i = 1, MS_HeroData.PropertyMax do
		self:InitProperty(i, true, true)
	end

	for i = 1, AnimalBase_Value.PropertySkillMax do
		self:InitPropertySkill(i, 0, 0)
	end
end

function AnimalBase_Value:LoadSaveProperty()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local isHost = self.animal:IsHost()
		local isCallHero = false

		if isHost == false then
			isCallHero = self.animal:IsMonsterType(AnimalBase_Define.MonsterType.CallHero)
		end

		if isHost == true or isCallHero == true then
			local tmpHp = FS_UserData.story:GetHeroProperty(self.animal:GetHeroId(), MS_HeroData.Property.Hp, isCallHero)

			if tmpHp ~= nil then
				self.property[MS_HeroData.Property.Hp] = Mathf.Min(tonumber(tmpHp), self:GetPropertyMax(MS_HeroData.Property.Hp))
			end

			local tmpRage = FS_UserData.story:GetHeroProperty(self.animal:GetHeroId(), MS_HeroData.Property.Rage, isCallHero)

			if tmpRage ~= nil then
				self.property[MS_HeroData.Property.Rage] = Mathf.Min(tonumber(tmpRage), self:GetPropertyMax(MS_HeroData.Property.Rage))
			end

			local tmpPower = FS_UserData.story:GetHeroProperty(self.animal:GetHeroId(), MS_HeroData.Property.Power, isCallHero)

			if tmpPower ~= nil then
				self.property[MS_HeroData.Property.Power] = Mathf.Min(tonumber(tmpPower), self:GetPropertyMax(MS_HeroData.Property.Power))
			end

			local tmpSan = FS_UserData.story:GetHeroProperty(self.animal:GetHeroId(), MS_HeroData.Property.San, isCallHero)

			if tmpSan ~= nil then
				self.property[MS_HeroData.Property.San] = Mathf.Min(tonumber(tmpSan), self:GetPropertyMax(MS_HeroData.Property.San))
			end

			if self.animal:IsHostBack() == false and self:GetSanType() == AnimalBase_Define.SanType.Crazy then
				self:SetSanPropertyLockCrazy(true)
			end

			if self:CheckDead() == true then
				self.property[MS_HeroData.Property.Hp] = 0

				self.animal:ChangeToDeath(AnimalBase_Define.DeadReason.None)
			end

			self:ShowValue()
		end
	end
end

function AnimalBase_Value:RebornValue(reset, propertyRateList)
	self:SetSanPropertyLockCrazy(false)
	self:SetSanPropertyLockBoss(false)
	self:SetPropertyToMax(MS_HeroData.Property.San)
	self:RefreshPropertyAll(true, reset, propertyRateList)
end

function AnimalBase_Value:ShowValue()
	self:ShowHp(true, 0)
	self:ShowEnergy(true, 0)
	self:ShowRage(true, 0)
	self:ShowPower(true, 0)
	self:ShowWeakness(true, 0)
	self:ShowSan(true, 0)

	if self.animal.type == AnimalBase_Define.Type.HomeBase then
		UIManager.SendMessage("Mainmenu", "SetPveBuildingHpWarningThreshold", 0.3)
	end

	if self.gameController ~= nil and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.animal:IsHost() == true and self.animal:IsHostBack() == false then
		if self:GetSanType() ~= AnimalBase_Define.SanType.Normal then
			self.gameController:HostPlayerNotNormal(true)
			self:SetInSanDuration(true)
		else
			self.gameController:HostPlayerNotNormal(false)
			self:SetInSanDuration(false)
		end
	end
end

function AnimalBase_Value:InitPropertyBase()
	if self.heroSaveData ~= nil then
		for propertyId = 1, MS_HeroData.PropertyMax do
			self.propertyBase[propertyId] = self.heroSaveData:GetProperty(propertyId)
		end
	else
		local tmpPropertyList = FS_HeroData.GetPropertyAll(self.heroId, self.level, self.animal:IsHost())

		for propertyId = 1, MS_HeroData.PropertyMax do
			self.propertyBase[propertyId] = tmpPropertyList[propertyId]
		end

		if self.animal.type == AnimalBase_Define.Type.Hero then
			if self.animal:IsMonsterType(AnimalBase_Define.MonsterType.SanMonster) == true then
				self.propertyBase[MS_HeroData.Property.Hp] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.Hp] * AnimalBase_Define.SanMonsterHp / 1000)
				self.propertyBase[MS_HeroData.Property.PhysicDamage] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.PhysicDamage] * AnimalBase_Define.SanMonsterPhysicDamage / 1000)
				self.propertyBase[MS_HeroData.Property.Weakness] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.Weakness] * AnimalBase_Define.SanMonsterWeakness / 1000)
				self.propertyBase[MS_HeroData.Property.WeaknessRecovery] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.WeaknessRecovery] * AnimalBase_Define.SanMonsterWeaknessRecovery / 1000)
			elseif self.animal:IsMonsterType(AnimalBase_Define.MonsterType.CallHero) == true then
				if self.animal:IsHostTeam() == true then
					self.propertyBase[MS_HeroData.Property.Hp] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.Hp] * AnimalBase_Define.CallHeroHp / 1000)
					self.propertyBase[MS_HeroData.Property.PhysicDamage] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.PhysicDamage] * AnimalBase_Define.CallHeroPhysicDamage / 1000)
				else
					self.propertyBase[MS_HeroData.Property.Hp] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.Hp] * AnimalBase_Define.SanMonsterHp / 1000)
					self.propertyBase[MS_HeroData.Property.PhysicDamage] = Mathf.Ceil(self.propertyBase[MS_HeroData.Property.PhysicDamage] * AnimalBase_Define.SanMonsterPhysicDamage / 1000)
				end
			end
		end
	end

	local trophyProperty

	if self.animal:IsHost() == true then
		trophyProperty = FS_UserData.trophy:GetResult()
	end

	for propertyId = 1, MS_HeroData.PropertyMax do
		if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and self.animal:IsHost() == true then
			if propertyId == MS_HeroData.Property.Toughness then
				self.propertyBase[propertyId] = self.propertyBase[propertyId] + AnimalBase_Value.GetCasualToughnessAdd()
			elseif propertyId == MS_HeroData.Property.Energy then
				self.propertyBase[propertyId] = self.propertyBase[propertyId] + self.propertyBase[propertyId] * AnimalBase_Value.GetCasualEnergyRatio()
			end
		end

		local tmpTalentPropertyAdd = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.PropertyAdd, propertyId, 0)

		if tmpTalentPropertyAdd > 0 then
			local tmpAdd = self.propertyBase[propertyId] * tmpTalentPropertyAdd / 1000

			self.propertyBase[propertyId] = self.propertyBase[propertyId] + tmpAdd
		end

		if trophyProperty ~= nil then
			self.propertyBase[propertyId] = self.propertyBase[propertyId] + trophyProperty[propertyId]
		end

		if self.heroPropertyData ~= nil and self.heroPropertyData["Property_" .. propertyId] ~= nil then
			self.propertyBase[propertyId] = self.propertyBase[propertyId] + self.heroPropertyData["Property_" .. propertyId]
		end

		self.propertyMax[propertyId] = self.propertyBase[propertyId]
	end
end

function AnimalBase_Value:InitProperty(propertyId, isStart, reset)
	if isStart == true then
		if propertyId == MS_HeroData.Property.Rage or propertyId == MS_HeroData.Property.TrophyShield or propertyId == MS_HeroData.Property.SkillShield then
			if reset == true then
				self.property[propertyId] = 0
			elseif self.property[propertyId] > self:GetPropertyMax(propertyId) then
				self.property[propertyId] = self:GetPropertyMax(propertyId)
			end
		else
			self.property[propertyId] = self:GetPropertyMax(propertyId)
		end
	elseif self.property[propertyId] > self:GetPropertyMax(propertyId) then
		self.property[propertyId] = self:GetPropertyMax(propertyId)
	end
end

function AnimalBase_Value:RefreshPropertyAll(isStart, reset, propertyRateList)
	self:InitPropertyBase()
	self:UpdatePropertyMaxDiff()

	for i = 1, MS_HeroData.PropertyMax do
		self:InitProperty(i, isStart, reset)
	end

	for i = 1, AnimalBase_Value.PropertySkillMax do
		self:InitPropertySkill(i, 0, 0)
	end

	if isStart == true and propertyRateList ~= nil then
		for propertyId, rate in pairs(propertyRateList) do
			if rate > 0 then
				self.property[propertyId] = Mathf.Ceil(rate * self:GetPropertyMax(propertyId))
			end
		end
	end

	if self.animal:IsHost() and self.animal:IsHostBack() == false and self.sanPropertyLockCrazy == true then
		local max = self:GetSanBound(AnimalBase_Define.SanType.Crazy)

		self.property[MS_HeroData.Property.San] = Mathf.Clamp(self.property[MS_HeroData.Property.San], 0, max)
	end

	self:ShowValue()
end

function AnimalBase_Value:GetProperty(propertyId)
	if DebugPropertyTest == true then
		if propertyId == MS_HeroData.Property.Weakness then
			self.property[propertyId] = Mathf.Min(self.property[propertyId], DebugProperty1)
		elseif propertyId == MS_HeroData.Property.WeaknessRecovery then
			self.property[propertyId] = Mathf.Min(self.property[propertyId], DebugProperty2)
		elseif propertyId == MS_HeroData.Property.Toughness then
			self.property[propertyId] = Mathf.Min(self.property[propertyId], DebugProperty3)
		elseif propertyId == MS_HeroData.Property.ToughnessRecovery then
			self.property[propertyId] = Mathf.Min(self.property[propertyId], DebugProperty4)
		end
	end

	if self.property[propertyId] ~= nil then
		return self.property[propertyId]
	end

	return 0
end

function AnimalBase_Value:GetPropertyMax(propertyId)
	if DebugPropertyTest == true then
		if propertyId == MS_HeroData.Property.Weakness then
			return DebugProperty1
		elseif propertyId == MS_HeroData.Property.WeaknessRecovery then
			return DebugProperty2
		elseif propertyId == MS_HeroData.Property.Toughness then
			return DebugProperty3
		elseif propertyId == MS_HeroData.Property.ToughnessRecovery then
			return DebugProperty4
		end
	end

	if self.propertyMax[propertyId] ~= nil then
		local propertyDiff = 0

		if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyId] ~= nil then
			propertyDiff = self.propertyMaxDiff[propertyId]
		end

		local ret = Mathf.Ceil(self.propertyMax[propertyId] + propertyDiff)

		if ret < 0 then
			ret = 0
		end

		return ret
	end

	return 0
end

function AnimalBase_Value:GetPropertyBase(propertyId)
	if DebugPropertyTest == true then
		if propertyId == MS_HeroData.Property.Weakness then
			return DebugProperty1
		elseif propertyId == MS_HeroData.Property.WeaknessRecovery then
			return DebugProperty2
		elseif propertyId == MS_HeroData.Property.Toughness then
			return DebugProperty3
		elseif propertyId == MS_HeroData.Property.ToughnessRecovery then
			return DebugProperty4
		end
	end

	if self.propertyBase[propertyId] ~= nil then
		return self.propertyBase[propertyId]
	end

	return 0
end

function AnimalBase_Value:GetAttribute(attributeId)
	if self.heroSaveData ~= nil then
		return self.heroSaveData:GetAttribute(attributeId)
	else
		return tonumber(self.heroData["Attribute_" .. attributeId])
	end
end

function AnimalBase_Value:InitPropertySkill(propertyId, skillIndex, skillCombo)
	self.propertySkill[propertyId] = 0

	if skillIndex > 0 and skillCombo > 0 then
		if propertyId == AnimalBase_Value.PropertySkill.Toughness then
			local skillToughness = self:GetSkillToughness(skillIndex, skillCombo)

			self.propertySkill[propertyId] = skillToughness

			if (skillIndex == AnimalBase_Define.SkillType.Eat or skillIndex == AnimalBase_Define.SkillType.EatFast) and self.animal:IsHost() == true then
				local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.EatToughnessAdd)

				if ret > 0 then
					self.propertySkill[propertyId] = self.propertySkill[propertyId] + ret
				end
			end
		elseif propertyId == AnimalBase_Value.PropertySkill.DamageSub then
			local skillDamageSub = self:GetSkillDamageSub(skillIndex, skillCombo)

			self.propertySkill[propertyId] = skillDamageSub
		end
	end
end

function AnimalBase_Value:ClearPropertySkill(propertyId)
	self.propertySkill[propertyId] = 0
end

function AnimalBase_Value:GetPropertySkill(propertyId)
	if self.propertySkill[propertyId] ~= nil then
		return self.propertySkill[propertyId]
	end

	return 0
end

function AnimalBase_Value:SetRebornFrame(frame)
	self.rebornFrame = frame
end

function AnimalBase_Value:SetRebornEnable(flg)
	self.rebornEnable = flg
end

function AnimalBase_Value:IsRebornEnable()
	return self.rebornEnable
end

function AnimalBase_Value:UpdatePropertyMaxDiff()
	local statusValueList = self.animal:GetStatusPropertyMaxValue()
	local isHost = self.animal:IsHost()

	for propertyId = 1, MS_HeroData.PropertyMax do
		self.propertyMaxDiffOld[propertyId] = self.propertyMaxDiff[propertyId]
		self.propertyMaxDiff[propertyId] = 0

		if statusValueList ~= nil and statusValueList[propertyId] ~= nil then
			self.propertyMaxDiff[propertyId] = self.propertyMaxDiff[propertyId] + statusValueList[propertyId]
		end

		if isHost == true then
			if self.animal:IsHeroSanNotNormal(10001) == true then
				if propertyId == MS_HeroData.Property.PhysicDamage then
					self:AddSanPropertyDiffRate(propertyId, Hero10001_Define.SanCrazyPhysicDamageAddRate, true)
				elseif propertyId == MS_HeroData.Property.Hp then
					self:SubSanPropertyDiffRate(propertyId, Hero10001_Define.SanCrazyHpSubRate, true)
				end
			elseif self.animal:IsHeroSanNotNormal(10002) == true then
				if propertyId == MS_HeroData.Property.CritDamage then
					self:AddSanPropertyDiffRate(propertyId, Hero10002_Define.SanCritDamageAddRate, true)
				elseif propertyId == MS_HeroData.Property.EnergyRecoveryTime and self.animal:IsHaveStatusById(Hero10002_Define.SanHitStatusId) == true then
					self:SubSanPropertyDiffRate(propertyId, Hero10002_Define.SanHitEnergyRecoveryDelayRate, true)
				end
			elseif self.animal:IsHeroSanNotNormal(10004) == true then
				if propertyId == MS_HeroData.Property.FireResist or propertyId == MS_HeroData.Property.PoisonResist or propertyId == MS_HeroData.Property.ArcaneResist or propertyId == MS_HeroData.Property.DarkResist then
					self:SubSanPropertyDiffRate(propertyId, Hero10004_Define.SanResistSubRate, true)
				elseif propertyId == MS_HeroData.Property.Toughness then
					self:AddSanPropertyDiffValue(propertyId, Hero10004_Define.SanToughnessAdd, true)
				end
			elseif self.animal:IsHeroSanNotNormal(10005) == true and propertyId == MS_HeroData.Property.DarkResist then
				self:SubSanPropertyDiffRate(propertyId, Hero10005_Define.SanSubDarkResistRate, true)
			end
		end

		if self.propertyMaxDiffOld[propertyId] ~= self.propertyMaxDiff[propertyId] then
			local old = self.property[propertyId]
			local max = self:GetPropertyMax(propertyId)

			if max < self.property[propertyId] then
				self.property[propertyId] = max
			end

			if propertyId == MS_HeroData.Property.Hp then
				self:ShowHp(false, old)
			elseif propertyId == MS_HeroData.Property.Energy then
				self:ShowEnergy(false, old)
			elseif propertyId == MS_HeroData.Property.Rage then
				self:ShowRage(false, old)
			elseif propertyId == MS_HeroData.Property.Power then
				self:ShowPower(false, old)
			elseif propertyId == MS_HeroData.Property.Weakness then
				self:ShowWeakness(false, old)
			elseif propertyId == MS_HeroData.Property.San then
				self:ShowSan(false, old)
			end
		end
	end
end

function AnimalBase_Value:AddSanPropertyDiffValue(propertyType, add, useTalent)
	if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyType] ~= nil then
		if useTalent == true then
			local tmpTalentAddValue = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeValue, propertyType, 0)

			if tmpTalentAddValue > 0 then
				add = add + tmpTalentAddValue
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("======AddSanPropertyDiffValue=====add=====" .. add .. ",tmpTalentAddValue=" .. tmpTalentAddValue)
			end
		end

		if add > 0 then
			self.propertyMaxDiff[propertyType] = self.propertyMaxDiff[propertyType] + add
		end
	end
end

function AnimalBase_Value:SubSanPropertyDiffValue(propertyType, sub, useTalent)
	if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyType] ~= nil then
		if useTalent == true then
			local tmpTalentAddValue = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeValue, propertyType, 0)

			if tmpTalentAddValue > 0 then
				sub = Mathf.Max(0, sub - tmpTalentAddValue)
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("======SubSanPropertyDiffValue=====sub=====" .. sub .. ",tmpTalentAddValue=" .. tmpTalentAddValue)
			end
		end

		if sub > 0 then
			self.propertyMaxDiff[propertyType] = self.propertyMaxDiff[propertyType] - sub
		end
	end
end

function AnimalBase_Value:AddSanPropertyDiffRate(propertyType, addRate, useTalent)
	if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyType] ~= nil then
		if useTalent == true then
			local tmpTalentRate = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeRate, propertyType, 0)

			if tmpTalentRate > 0 then
				addRate = MathHelper.addValuePermil(addRate, tmpTalentRate)
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("======AddSanPropertyDiffRate=====addRate=====" .. addRate .. ",tmpTalentRate=" .. tmpTalentRate)
			end
		end

		if addRate > 0 then
			local tmpAdd = self:GetPropertyBase(propertyType) * addRate / 1000

			self.propertyMaxDiff[propertyType] = self.propertyMaxDiff[propertyType] + tmpAdd
		end
	end
end

function AnimalBase_Value:SubSanPropertyDiffRate(propertyType, subRate, useTalent)
	if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyType] ~= nil then
		if useTalent == true then
			local tmpTalentRate = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeRate, propertyType, 0)

			if tmpTalentRate > 0 then
				subRate = MathHelper.subValuePermil(subRate, tmpTalentRate)
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("======SubSanPropertyDiffRate=====subRate=====" .. subRate .. ",tmpTalentRate=" .. tmpTalentRate)
			end
		end

		if subRate > 0 then
			local tmpSub = self:GetPropertyBase(propertyType) * subRate / 1000

			self.propertyMaxDiff[propertyType] = self.propertyMaxDiff[propertyType] - tmpSub
		end
	end
end

function AnimalBase_Value:ClearPropertyMaxDiff(propertyType)
	if self.propertyMaxDiff ~= nil and self.propertyMaxDiff[propertyType] ~= nil then
		self.propertyMaxDiff[propertyType] = 0
	end
end

function AnimalBase_Value:UpdatePeriodTime()
	local nowTime = TimeHelper.getNowTime()

	if self.animal:IsHost() == false or self.animal:IsHostBack() == true or self.animal:IsStop() == true then
		self.calculatePeriodTime = nowTime + 1

		return
	end

	if self.calculatePeriodTime <= 0 then
		self.calculatePeriodTime = nowTime
	end

	if nowTime >= self.calculatePeriodTime + 1 then
		local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DamagePerSec)

		if ret > 0 then
			local hpMax = self:GetPropertyMax(MS_HeroData.Property.Hp)
			local sub = Mathf.Ceil(hpMax * ret / 1000)

			self:SubProperty(MS_HeroData.Property.Hp, sub, -1, -1, 1)
		end

		self.calculatePeriodTime = self.calculatePeriodTime + 1
	end
end

function AnimalBase_Value:SetInSanDuration(flg)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false then
		return
	end

	if flg then
		self.inSanDuration = FS_UserData.story:GetInSanDuration()

		if self.inSanDuration > MS_Achievement.InSanDuration then
			self.gameController:RecordAchievement(MS_Achievement.AchievementIdType.UnnormalDuration, 1)

			self.inSanDuration = nil
			self.inSanFinishTime = nil
		else
			self.inSanFinishTime = TimeHelper.getNowTime() + MS_Achievement.InSanDuration - self.inSanDuration
		end
	else
		self.inSanDuration = nil
		self.inSanFinishTime = nil
	end
end

function AnimalBase_Value:UpdateInSanDuration()
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == false then
		return
	end

	if self.inSanFinishTime == nil or self.animal:IsHost() == false or self.animal:IsHostBack() == true then
		return
	end

	if (self:GetSanType() == AnimalBase_Define.SanType.Crazy or self:GetSanType() == AnimalBase_Define.SanType.Unusual) and TimeHelper.getNowTime() >= self.inSanFinishTime then
		self.gameController:RecordAchievement(MS_Achievement.AchievementIdType.UnnormalDuration, 1)

		self.inSanDuration = nil
		self.inSanFinishTime = nil
	end
end

function AnimalBase_Value:Update()
	self:UpdatePropertyMaxDiff()
	self:UpdatePeriodTime()
	self:UpdateInSanDuration()

	if self:CheckDead() == true then
		self:SetPropertyToZero(MS_HeroData.Property.Hp)
		self.animal:ChangeToDead(AnimalBase_Define.DeadReason.None)
	end

	local deltaTime = ControllerMain.GetLogicDeltaTime()

	self.energyRecoveryDelayTime = Mathf.Max(0, self.energyRecoveryDelayTime - deltaTime)

	if self.animal.type ~= AnimalBase_Define.Type.HomeBase then
		if self.animal:IsDead() == false then
			local recoveryFlg = true

			if self.animal:IsSkilling() == true and self.animal:IsBlocking() == false and self.animal:IsSkillingById(AnimalBase_Define.SkillType.Eat, 0) == false and self.animal:IsSkillingById(AnimalBase_Define.SkillType.Execute, 0) == false and self.animal:IsSkillingById(AnimalBase_Define.SkillType.Backstab, 0) == false then
				local skillIndex, skillCombo = self.animal:GetSkillingData()
				local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

				if skillData.EnergyRecoveryForce > 0 then
					recoveryFlg = true
				else
					local useEnergy = self:GetSkillEnergy(skillIndex, skillCombo)
					local useEnergyPeriod = self:GetSkillEnergyPeriod(skillIndex, skillCombo)

					if useEnergy >= 0 or useEnergyPeriod > 0 then
						recoveryFlg = false

						local isRunExit = self.animal:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

						if isRunExit > 0 then
							recoveryFlg = true
						end
					end
				end
			end

			if recoveryFlg == true and self.energyRecoveryDelayTime <= 0 then
				self:RecoveryEnergy()
			end

			if self.animal:IsHit() == false then
				self:RecoveryToughness()
			end

			if self.animal:IsHitByType(AnimalBase_Define.HitType.StatusWeak) == false and self:GetProperty(MS_HeroData.Property.Weakness) > 0 then
				self:RecoveryWeakness()
			end
		elseif self.rebornEnable == true then
			self.deadFrame = self.deadFrame + 1

			if self.animal:IsHost() and self.animal:IsHostBack() == false then
				local timeLeft = (self.rebornFrame - self.deadFrame) * deltaTime
				local timeTotal = self.rebornFrame * deltaTime

				UIManager.SendMessage("Mainmenu", "UpdateDeadPanel", timeLeft, timeTotal)
			end

			if self.deadFrame >= self.rebornFrame then
				self:Reborn(true, nil)
			end
		end
	end
end

function AnimalBase_Value:SetEnergyRecoveryDelayTime(delay)
	self.energyRecoveryDelayTime = delay
end

function AnimalBase_Value:Reborn(reset, propertyRateList)
	self:RebornValue(reset, propertyRateList)
	self:ShowValue()

	if self.animal:IsHost() then
		if self.animal:IsHostBack() == false then
			UIManager.SendMessage("Mainmenu", "Reborn")
		end
	else
		UIManager.SendMessage("HeadInfo", "Reborn", self.animal:GetAnimalId())
	end
end

function AnimalBase_Value:IsWillDead()
	if self:GetProperty(MS_HeroData.Property.Hp) <= 0 then
		return true
	end

	if self.animal:IsHost() == true and self.animal.type == AnimalBase_Define.Type.Hero and self:GetProperty(MS_HeroData.Property.San) <= 0 then
		return true
	end

	return false
end

function AnimalBase_Value:CheckDead()
	if self.animal:IsDead() == false then
		if self:GetProperty(MS_HeroData.Property.Hp) <= 0 then
			if self.animal:IsHost() == true and DebugDontDeadSelf == true or self.animal:IsHost() == false and DebugDontDeadMonster == true then
				self:SetPropertyToMax(MS_HeroData.Property.San)
				self:SetPropertyToMax(MS_HeroData.Property.Hp)
				self.animal:RevertDead()
			else
				return true
			end
		elseif self.animal.type == AnimalBase_Define.Type.Hero and self:GetProperty(MS_HeroData.Property.San) <= 0 and self.animal:IsHost() == true and self.animal.type == AnimalBase_Define.Type.Hero then
			if DebugDontDeadSelf == true then
				self:SetPropertyToMax(MS_HeroData.Property.San)
				self:SetPropertyToMax(MS_HeroData.Property.Hp)
				self.animal:RevertDead()
			else
				return true
			end
		end
	end

	return false
end

function AnimalBase_Value:Dead()
	self.deadFrame = 0
	self.energyRecoveryDelayTime = 0
end

function AnimalBase_Value:IsWeaknessEmpty()
	local weakness = self:GetProperty(MS_HeroData.Property.Weakness)

	if weakness <= 0 then
		return true
	end

	return false
end

function AnimalBase_Value:IsToughnessEmpty()
	local toughness = self:GetProperty(MS_HeroData.Property.Toughness)
	local toughnessSkill = self:GetPropertySkill(AnimalBase_Value.PropertySkill.Toughness)
	local add = toughness + toughnessSkill

	if add <= 0 then
		return true
	end

	return false
end

function AnimalBase_Value:GetSkillToughness(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData == nil then
		return 0
	end

	local toughness = skillData.Toughness
	local tmpTalentToughness = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SkillToughnessAdd, skillIndex, skillCombo)

	if tmpTalentToughness > 0 then
		toughness = toughness + tmpTalentToughness
	end

	return toughness
end

function AnimalBase_Value:GetSkillDamageSub(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData == nil then
		return 0
	end

	local damageSub = skillData.DamageSub
	local tmpDamageSub = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SkillDamageSubAdd, skillIndex, skillCombo)

	if tmpDamageSub > 0 then
		damageSub = damageSub + tmpDamageSub
	end

	return damageSub
end

function AnimalBase_Value:GetSkillEnergy(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData == nil then
		return 0
	end

	local useEnergy = skillData.EnergySub

	if useEnergy > 0 then
		local tmpTalentEnergy = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SkillEnergySub, skillIndex, skillCombo)

		if tmpTalentEnergy > 0 then
			useEnergy = MathHelper.subValuePermil(useEnergy, tmpTalentEnergy)
		end
	end

	return useEnergy
end

function AnimalBase_Value:GetSkillEnergyPeriod(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData == nil then
		return 0
	end

	local useEnergy = skillData.EnergySubPeriod

	return useEnergy
end

function AnimalBase_Value:CheckSkillEnergy(skillIndex, skillCombo)
	local useEnergy = self:GetSkillEnergy(skillIndex, skillCombo)

	if useEnergy > 0 then
		if self:GetProperty(MS_HeroData.Property.Energy) > 0 then
			return true
		end
	else
		return true
	end

	if self.animal:IsHost() and self.animal:IsHostBack() == false then
		UIManager.SendMessage("Mainmenu", "ShowUseEnergyWarning", true)
	end

	return false
end

function AnimalBase_Value:UseSkillEnergy(skillIndex, skillCombo)
	if self.animal:IsHaveStatusByType(MS_StatusData.LogicType.EnergyDontUse) == true then
		return 0
	end

	local useEnergy = self:GetSkillEnergy(skillIndex, skillCombo)

	if self:GetProperty(MS_HeroData.Property.Energy) > 0 then
		if self.animal:IsHost() == true and (skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or skillIndex == AnimalBase_Define.SkillType.Dodge or skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial or skillIndex == AnimalBase_Define.SkillType.DodgeJump) then
			local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DodgeEnergySub)

			if ret > 0 then
				useEnergy = MathHelper.subValuePermil(useEnergy, ret)
			end
		end

		if DebugEnergySubLessSelf then
			useEnergy = useEnergy * 0.5
		end

		self:SubProperty(MS_HeroData.Property.Energy, useEnergy)

		if DebugValueLog == true then
			SystemHelper.LogTest("====Energy!!!skillIndex=" .. skillIndex .. ",skillCombo=" .. skillCombo .. ",subEnergy=" .. useEnergy .. ",nowEnergy=" .. self:GetProperty(MS_HeroData.Property.Energy))
		end
	end

	return useEnergy
end

function AnimalBase_Value:IsHaveSkillEnergy()
	if self:GetProperty(MS_HeroData.Property.Energy) > 0 then
		return true
	else
		return false
	end
end

function AnimalBase_Value:UseSkillRage(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.animal:GetHeroId(), skillIndex, skillCombo)
	local tmpRage = skillData.RageSub

	if tmpRage > 0 then
		local tmpTalentRage = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SkillRageSub, skillIndex, skillCombo)

		if tmpTalentRage > 0 then
			tmpRage = MathHelper.subValuePermil(tmpRage, tmpTalentRage)
		end

		self:SubProperty(MS_HeroData.Property.Rage, tmpRage)
	end
end

function AnimalBase_Value:UseSkillPower(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.animal:GetHeroId(), skillIndex, skillCombo)
	local tmpPower = skillData.PowerSub

	if tmpPower > 0 then
		if self.animal:IsHeroSanNotNormal(10003) == true then
			local tmpAddRate = Hero10003_Define.SanPowerAddRate
			local tmpTalentRate = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeRate, MS_HeroData.Property.Power, 0)

			if tmpTalentRate > 0 then
				tmpAddRate = MathHelper.subValuePermil(tmpAddRate, tmpTalentRate)
			end

			tmpPower = MathHelper.addValuePermil(tmpPower, tmpAddRate)
		end

		self:SubProperty(MS_HeroData.Property.Power, tmpPower)
	end
end

function AnimalBase_Value:SubProperty(propertyId, sub, param1, param2, param3, reason)
	local min = -1

	if self.propertyLockMin ~= nil and self.propertyLockMin[propertyId] ~= nil then
		min = self.propertyLockMin[propertyId]
	end

	if propertyId == MS_HeroData.Property.San and self.sanPropertyLockBoss == true then
		min = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
	end

	if (AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo) and propertyId == MS_HeroData.Property.San then
		min = 1
	end

	if param3 ~= nil and param3 > 0 then
		param3 = Mathf.Max(min, param3)
	else
		param3 = min
	end

	return self:SubPropertyCommon(propertyId, sub, false, param1 or -1, param2 or -1, param3 or -1, reason)
end

function AnimalBase_Value:SubPropertyPeriod(propertyId, sub, param1, param2, param3, reason)
	local min = -1

	if self.propertyLockMin ~= nil and self.propertyLockMin[propertyId] ~= nil then
		min = self.propertyLockMin[propertyId]
	end

	if propertyId == MS_HeroData.Property.San and self.sanPropertyLockBoss == true then
		min = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
	end

	if param3 ~= nil and param3 > 0 then
		param3 = Mathf.Max(min, param3)
	else
		param3 = min
	end

	return self:SubPropertyCommon(propertyId, sub, true, param1 or -1, param2 or -1, param3 or -1, reason)
end

function AnimalBase_Value:SubPropertyCommon(propertyId, sub, isPeriod, param1, param2, param3, reason)
	if sub <= 0 or self.property[propertyId] == nil or self.propertyMax[propertyId] == nil then
		return 0
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
		if MS_StoryList.IsStoryMazeStart(self.storyId) == false and MS_StoryList.IsStoryMaze(self.storyId) == false and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and self.animal:IsHost() == false and self.animal:IsHostTeam() == true and (propertyId == MS_HeroData.Property.Hp or propertyId == MS_HeroData.Property.San) then
			return 0
		end

		if propertyId == MS_HeroData.Property.Hp then
			if self.sceneController:IsHostPlayerDead() == true or self.gameController:IsStopAttack() == true then
				return 0
			end
		elseif propertyId == MS_HeroData.Property.San and (self.sceneController:IsHostPlayerDead() == true or self.gameController:IsStopAttack() == true or MS_StoryList.IsStoryDream(self.storyId) == true) then
			return 0
		end
	end

	local sanTypeOld = AnimalBase_Define.SanType.Normal

	if propertyId == MS_HeroData.Property.San then
		if DebugDontUseSan == true then
			return 0
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == true and self.gameController:IsBossMode() == false then
			return 0
		end

		sanTypeOld = self:GetSanType()
	elseif propertyId == MS_HeroData.Property.Weakness and self.animal:IsNoWeakness() == true then
		return 0
	end

	local old = self.property[propertyId]
	local minValue = param3

	if propertyId == MS_HeroData.Property.Hp then
		if sub > 0 then
			local skillShield = self:GetProperty(MS_HeroData.Property.SkillShield)

			if skillShield > 0 then
				local tmpDiff = self:SubProperty(MS_HeroData.Property.SkillShield, sub)

				sub = Mathf.Max(0, sub - tmpDiff)
			end
		end

		if sub > 0 then
			local trophyShield = self:GetProperty(MS_HeroData.Property.TrophyShield)

			if trophyShield > 0 then
				local tmpDiff = self:SubProperty(MS_HeroData.Property.TrophyShield, sub)

				sub = Mathf.Max(0, sub - tmpDiff)
			end
		end

		if sub <= 0 then
			return 0
		end

		if DebugDontDeadSelf == true and self.animal:IsHost() == true then
			minValue = Mathf.Max(minValue, 1)
		end

		if DebugDontDeadMonster == true and self.animal:IsHost() == false then
			minValue = Mathf.Max(minValue, 1)
		end

		if param3 > 0 then
			minValue = Mathf.Max(minValue, param3)
		end
	end

	if minValue > 0 then
		if minValue <= self.property[propertyId] then
			sub = Mathf.Min(self.property[propertyId] - minValue, sub)
		else
			sub = 0
		end
	end

	self.property[propertyId] = self.property[propertyId] - sub

	if propertyId == MS_HeroData.Property.Hp then
		local useNoDeath = true

		if reason ~= nil and reason ~= AnimalBase_Define.DamageReason.None then
			useNoDeath = false
		end

		if useNoDeath == true and self.property[propertyId] <= 0 then
			if self.animal:IsHaveStatusByType(MS_StatusData.LogicType.NoDeath) then
				self.property[propertyId] = 1

				self.animal:ClearStatusByType(MS_StatusData.LogicType.NoDeath)
			elseif self.animal:IsHaveStatusById(MS_StatusData.NoDeathAddId) then
				local status = self.animal:GetStatusById(MS_StatusData.NoDeathAddId)

				if status ~= nil then
					self.property[propertyId] = 1

					local ret = status:SubOverlay()

					if ret == false then
						self.animal:ClearStatusById(MS_StatusData.NoDeathAddId)
					end
				end
			end
		end
	end

	self.property[propertyId] = Mathf.Clamp(self.property[propertyId], 0, self:GetPropertyMax(propertyId))

	if propertyId == MS_HeroData.Property.Hp then
		self:ShowHp(false, old)

		if isPeriod == false and self.animal:IsHost() == false then
			local show = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.ShowDamageValue)

			if DebugSeeTruth then
				show = 1
			end

			if show > 0 then
				if param1 > 0 then
					UIManager.SendMessage("HitNumber", "Create", self.animal:GetUIDamageInfoPosition(param2), -sub, HitNumberCtrl.Type.CriticalHit)
				else
					UIManager.SendMessage("HitNumber", "Create", self.animal:GetUIDamageInfoPosition(param2), -sub, HitNumberCtrl.Type.NormalHit)
				end
			end
		end
	elseif propertyId == MS_HeroData.Property.Energy then
		self:ShowEnergy(false, old)
	elseif propertyId == MS_HeroData.Property.Rage then
		self:ShowRage(false, old)
	elseif propertyId == MS_HeroData.Property.Power then
		self:ShowPower(false, old)
	elseif propertyId == MS_HeroData.Property.Weakness then
		self:ShowWeakness(false, old)
	elseif propertyId == MS_HeroData.Property.San then
		if self.animal:IsHost() and self.animal:IsHostBack() == false then
			if sanTypeOld ~= AnimalBase_Define.SanType.Crazy and self:GetSanType() == AnimalBase_Define.SanType.Crazy then
				self.gameController:HostPlayerCrazy(true)
				self:SetSanPropertyLockCrazy(true)
			end

			if sanTypeOld == AnimalBase_Define.SanType.Normal and self:GetSanType() ~= AnimalBase_Define.SanType.Normal then
				self.gameController:HostPlayerNotNormal(true)
				self:SetInSanDuration(true)
			end

			UIManager.SendMessage("Mainmenu", "SetSanityDelta", -sub)
		end

		self:ShowSan(false, old)
	elseif propertyId == MS_HeroData.Property.TrophyShield then
		self:ShowShield()
	elseif propertyId == MS_HeroData.Property.SkillShield then
		self:ShowShield()
	end

	return Mathf.Min(sub, old - self:GetProperty(propertyId))
end

function AnimalBase_Value:AddProperty(propertyId, add, param)
	return self:AddPropertyCommon(propertyId, add, false, param or 0)
end

function AnimalBase_Value:AddPropertyPeriod(propertyId, add, param)
	return self:AddPropertyCommon(propertyId, add, true, param or 0)
end

function AnimalBase_Value:AddPropertyCommon(propertyId, add, isPeriod)
	if add <= 0 or self.property[propertyId] == nil or self.propertyMax[propertyId] == nil then
		return 0
	end

	local max = self:GetPropertyMax(propertyId)
	local sanTypeOld = AnimalBase_Define.SanType.Normal

	if propertyId == MS_HeroData.Property.San then
		if MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			local base = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
			local tmpAdd = Mathf.Clamp(base - self.property[propertyId], 0, base)

			add = add + tmpAdd
		elseif self.sanPropertyLockCrazy == true then
			max = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
		end

		if DebugDontUseSan == true then
			return 0
		end

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) == true and self.gameController:IsBossMode() == false then
			return 0
		end

		sanTypeOld = self:GetSanType()
	end

	local old = self.property[propertyId]

	self.property[propertyId] = self.property[propertyId] + add
	self.property[propertyId] = Mathf.Clamp(self.property[propertyId], 0, max)

	if propertyId == MS_HeroData.Property.Hp then
		self:ShowHp(false, old)

		if isPeriod == false and self.animal:IsHost() == false then
			UIManager.SendMessage("HitNumber", "Create", self.animal:GetUIDamageInfoPosition(-1), add, HitNumberCtrl.Type.AddHP)
		end
	elseif propertyId == MS_HeroData.Property.Energy then
		self:ShowEnergy(false, old)
	elseif propertyId == MS_HeroData.Property.Rage then
		if self.animal:IsHost() == true and self.gameController:IsPermitRageMax(self.animal:GetHeroId()) == false and max <= self.property[propertyId] then
			self.property[propertyId] = max - 1
		end

		self:ShowRage(false, old)
	elseif propertyId == MS_HeroData.Property.Power then
		self:ShowPower(false, old)
	elseif propertyId == MS_HeroData.Property.Weakness then
		self:ShowWeakness(false, old)
	elseif propertyId == MS_HeroData.Property.San then
		self:ShowSan(false, old)

		if self.animal:IsHost() and self.animal:IsHostBack() == false then
			if sanTypeOld ~= AnimalBase_Define.SanType.Normal and self:GetSanType() == AnimalBase_Define.SanType.Normal then
				self.gameController:HostPlayerNotNormal(false)
				self:SetInSanDuration(false)
				self:UpdatePropertyMaxDiff()
			end

			UIManager.SendMessage("Mainmenu", "SetSanityDelta", add)
		end
	elseif propertyId == MS_HeroData.Property.TrophyShield then
		self:ShowShield()
	elseif propertyId == MS_HeroData.Property.SkillShield then
		self:ShowShield()
	end

	return Mathf.Min(add, self:GetProperty(propertyId) - old)
end

function AnimalBase_Value:SetHpToPercent(per)
	if per > 0 and per < 1 then
		local max = self:GetPropertyMax(MS_HeroData.Property.Hp)
		local old = self.property[MS_HeroData.Property.Hp]

		self.property[MS_HeroData.Property.Hp] = max * per

		self:ShowHp(false, old)
	end
end

function AnimalBase_Value:AddSanPercentInMaze(per)
	if per <= 0 then
		return
	end

	if per >= 1 then
		self:SetPropertyToMax(MS_HeroData.Property.San)

		return
	end

	local min = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
	local max = self:GetPropertyMax(MS_HeroData.Property.San)
	local sanAdd = (max - min) * per

	self:AddProperty(MS_HeroData.Property.San, sanAdd)
end

function AnimalBase_Value:SetPropertyToMax(propertyId)
	if self.property[propertyId] == nil or self.propertyMax[propertyId] == nil then
		return 0
	end

	local max = self:GetPropertyMax(propertyId)
	local sanTypeOld = AnimalBase_Define.SanType.Normal

	if propertyId == MS_HeroData.Property.San then
		if self.sanPropertyLockCrazy == true then
			max = self:GetSanBound(AnimalBase_Define.SanType.Crazy)
		end

		sanTypeOld = self:GetSanType()
	end

	local old = self.property[propertyId]

	self.property[propertyId] = max

	if propertyId == MS_HeroData.Property.Hp then
		self:ShowHp(false, old)
	elseif propertyId == MS_HeroData.Property.Energy then
		self:ShowEnergy(false, old)
	elseif propertyId == MS_HeroData.Property.Rage then
		self:ShowRage(false, old)
	elseif propertyId == MS_HeroData.Property.Power then
		self:ShowPower(false, old)
	elseif propertyId == MS_HeroData.Property.Weakness then
		self:ShowWeakness(false, old)
	elseif propertyId == MS_HeroData.Property.San then
		self:ShowSan(false, old)

		if self.animal:IsHost() and self.animal:IsHostBack() == false and sanTypeOld ~= AnimalBase_Define.SanType.Normal and self:GetSanType() == AnimalBase_Define.SanType.Normal then
			self.gameController:HostPlayerNotNormal(false)
			self:SetInSanDuration(false)
			self:UpdatePropertyMaxDiff()
		end
	elseif propertyId == MS_HeroData.Property.TrophyShield then
		self:ShowShield()
	elseif propertyId == MS_HeroData.Property.SkillShield then
		self:ShowShield()
	end

	return self:GetProperty(propertyId) - old
end

function AnimalBase_Value:SetPropertyToZero(propertyId)
	if self.property[propertyId] == nil or self.propertyMax[propertyId] == nil then
		return 0
	end

	if propertyId == MS_HeroData.Property.Hp then
		if self.sceneController:IsHostPlayerDead() == true or self.gameController:IsStopAttack() == true then
			return 0
		end
	elseif propertyId == MS_HeroData.Property.San and (self.sceneController:IsHostPlayerDead() == true or self.gameController:IsStopAttack() == true or MS_StoryList.IsStoryDream(self.storyId) == true) then
		return 0
	end

	local old = self.property[propertyId]
	local sanTypeOld = AnimalBase_Define.SanType.Normal

	if propertyId == MS_HeroData.Property.San then
		sanTypeOld = self:GetSanType()
	end

	self.property[propertyId] = 0

	if propertyId == MS_HeroData.Property.Hp then
		self:ShowHp(false, old)
	elseif propertyId == MS_HeroData.Property.Energy then
		self:ShowEnergy(false, old)
	elseif propertyId == MS_HeroData.Property.Rage then
		self:ShowRage(false, old)
	elseif propertyId == MS_HeroData.Property.Power then
		self:ShowPower(false, old)
	elseif propertyId == MS_HeroData.Property.Weakness then
		self:ShowWeakness(false, old)
	elseif propertyId == MS_HeroData.Property.San then
		if self.animal:IsHost() and self.animal:IsHostBack() == false then
			if sanTypeOld ~= AnimalBase_Define.SanType.Crazy and self:GetSanType() == AnimalBase_Define.SanType.Crazy then
				self.gameController:HostPlayerCrazy(true)
				self:SetSanPropertyLockCrazy(true)
			end

			if sanTypeOld == AnimalBase_Define.SanType.Normal and self:GetSanType() ~= AnimalBase_Define.SanType.Normal then
				self.gameController:HostPlayerNotNormal(true)
				self:SetInSanDuration(true)
			end
		end

		self:ShowSan(false, old)
	elseif propertyId == MS_HeroData.Property.TrophyShield then
		self:ShowShield()
	elseif propertyId == MS_HeroData.Property.SkillShield then
		self:ShowShield()
	end

	return old
end

function AnimalBase_Value:IsPropertyMax(propertyId)
	if self.property[propertyId] == nil or self.propertyMax[propertyId] == nil then
		return false
	end

	if self:GetProperty(propertyId) >= self:GetPropertyMax(propertyId) then
		return true
	end

	return false
end

function AnimalBase_Value:SubPropertySkill(propertyId, sub)
	if sub <= 0 or self.propertySkill[propertyId] == nil then
		return 0
	end

	local old = self.propertySkill[propertyId]

	self.propertySkill[propertyId] = self.propertySkill[propertyId] - sub
	self.propertySkill[propertyId] = Mathf.Clamp(self.propertySkill[propertyId], 0, old)

	return old - self:GetPropertySkill(propertyId)
end

function AnimalBase_Value:SetPropertyLockMin(propertyId, value)
	if self.propertyLockMin ~= nil and self.propertyLockMin[propertyId] ~= nil then
		self.propertyLockMin[propertyId] = value
	end
end

function AnimalBase_Value:ShowHpNPC()
	if self.animal.type == AnimalBase_Define.Type.Hero and self.animal:IsHost() == false then
		local showHp = Mathf.Clamp(self:GetProperty(MS_HeroData.Property.Hp) / self:GetPropertyMax(MS_HeroData.Property.Hp), 0, 1)

		UIManager.SendMessage("Mainmenu", "SetNpcHP", self.animal:GetAnimalId(), showHp)
	end
end

function AnimalBase_Value:ShowHp(isStart, old)
	local nowHp = self:GetProperty(MS_HeroData.Property.Hp)
	local maxHp = self:GetPropertyMax(MS_HeroData.Property.Hp)
	local showHp = Mathf.Clamp(nowHp / maxHp, 0, 1)

	if self.animal.type == AnimalBase_Define.Type.HomeBase then
		UIManager.SendMessage("Mainmenu", "SetPveBuildingHp", showHp)
	elseif self.animal:IsHost() then
		if self.animal:IsHostBack() == false then
			UIManager.SendMessage("Mainmenu", "SetHp", nowHp, maxHp, self:GetPropertyBase(MS_HeroData.Property.Hp), isStart == false)
			UIManager.SendMessage("PlayerInfo", "SetHp", nowHp, maxHp)

			if DebugShowHostHeader then
				UIManager.SendMessage("HeadInfo", "SetHp", self.animal:GetAnimalId(), showHp, nowHp, maxHp)
			end
		end
	else
		UIManager.SendMessage("HeadInfo", "SetHp", self.animal:GetAnimalId(), showHp, nowHp, maxHp)
	end

	local warnLine = AnimalBase_Value_Define.HP_WarnPercent * maxHp
	local warning = false

	if nowHp <= warnLine then
		warning = true
	end

	if isStart == true or warnLine < old and nowHp <= warnLine or old <= warnLine and warnLine < nowHp then
		if self.animal:IsHost() then
			if self.animal:IsHostBack() == false then
				UIManager.SendMessage("Mainmenu", "ShowHPWarning", warning)

				if DebugShowHostHeader then
					UIManager.SendMessage("HeadInfo", "ShowHPWarning", self.animal:GetAnimalId(), warning)
				end
			end
		else
			UIManager.SendMessage("HeadInfo", "ShowHPWarning", self.animal:GetAnimalId(), warning)
		end
	end
end

function AnimalBase_Value:ShowWeakness(isStart, old)
	local weakness = self:GetProperty(MS_HeroData.Property.Weakness)
	local weaknessMax = self:GetPropertyMax(MS_HeroData.Property.Weakness)
	local value = 0

	if weaknessMax > 0 then
		value = weakness / weaknessMax
	end

	local showWeakness = Mathf.Clamp(value, 0, 1)

	UIManager.SendMessage("HeadInfo", "SetToughness", self.animal:GetAnimalId(), showWeakness)
end

function AnimalBase_Value:SetToughness(toughness)
	local toughnessMax = self:GetPropertyMax(MS_HeroData.Property.Toughness)

	self.property[MS_HeroData.Property.Toughness] = Mathf.Clamp(toughness, 0, toughnessMax)
end

function AnimalBase_Value:ShowSan(isStart, old)
	if self.animal:IsHost() and self.animal:IsHostBack() == false then
		local sanSpecial = false

		if self.storyId == MS_StoryData.StoryId10011 or BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryMazeBoss(self.storyId) == true and FS_UserData.story:IsHaveMazeBoss() == true or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)
			local san = sanMax * (1 - AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Crazy]) - 0.1

			self.property[MS_HeroData.Property.San] = san
			sanSpecial = true
		end

		local nowSan = self:GetProperty(MS_HeroData.Property.San)
		local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)
		local showSan = Mathf.Clamp(nowSan / sanMax, 0, 1)
		local sanType = self:GetSanType()
		local retRatio = 0

		if sanType == AnimalBase_Define.SanType.Normal then
			retRatio = 0
		elseif sanType == AnimalBase_Define.SanType.Crazy then
			retRatio = 1

			if sanSpecial == true then
				sanType = AnimalBase_Define.SanType.Special
			end
		else
			local min = Mathf.Ceil(sanMax * AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Crazy])
			local max = Mathf.Ceil(sanMax * AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Unusual])

			retRatio = MathHelper.getValueInRadioRange(nowSan, min, max, 1, 0)
		end

		if MS_StoryList.IsStoryMaze(self.storyId) == false and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false then
			self.sceneController:SetCrazyRateConfig(retRatio, false)
		end

		UIManager.SendMessage("Mainmenu", "SetSanityValue", nowSan, sanMax, showSan, sanType, isStart)
		UIManager.SendMessage("PlayerInfo", "SetSanityValue", nowSan, sanMax, showSan, sanType)
	end
end

function AnimalBase_Value:ShowShield()
	local trophyShield = self:GetProperty(MS_HeroData.Property.TrophyShield)
	local skillShield = self:GetProperty(MS_HeroData.Property.SkillShield)
	local hpBase = self:GetPropertyBase(MS_HeroData.Property.Hp)

	if self.animal:IsHost() then
		if self.animal:IsHostBack() == false then
			UIManager.SendMessage("Mainmenu", "SetShield", trophyShield + skillShield, hpBase)
		end
	else
		UIManager.SendMessage("HeadInfo", "SetShield", trophyShield + skillShield, hpBase)
	end
end

function AnimalBase_Value:ShowRage(isStart, old)
	local nowRage = self:GetProperty(MS_HeroData.Property.Rage)
	local maxRage = self:GetPropertyMax(MS_HeroData.Property.Rage)

	if self.animal:IsHost() and self.animal:IsHostBack() == false then
		local showRage = Mathf.Clamp(nowRage / maxRage, 0, 1)

		UIManager.SendMessage("Mainmenu", "SetRage", showRage)

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) then
			if maxRage <= nowRage then
				UIManager.SendMessage("Mainmenu", "ShowTempGuideBottom", self.animal:GetHeroId())
			else
				UIManager.SendMessage("Mainmenu", "CloseTempGuideBottom")
			end
		end
	end
end

function AnimalBase_Value:ShowPower(isStart, old)
	if self.animal:IsHost() and self.animal:IsHostBack() == false then
		local showPower = Mathf.Clamp(self:GetProperty(MS_HeroData.Property.Power) / self:GetPropertyMax(MS_HeroData.Property.Power), 0, 1)

		UIManager.SendMessage("Mainmenu", "SetKarma", showPower)
	end
end

function AnimalBase_Value:ShowEnergy(isStart, old)
	local energyMaxOld = self:GetPropertyBase(MS_HeroData.Property.Energy)
	local nowEnergy = self:GetProperty(MS_HeroData.Property.Energy)
	local maxEnergy = self:GetPropertyMax(MS_HeroData.Property.Energy)
	local showEnergy = Mathf.Clamp(nowEnergy / energyMaxOld, -1, 1)
	local showEnergyMax = Mathf.Clamp(maxEnergy / energyMaxOld, 0, 1)

	if self.animal:IsHost() then
		if self.animal:IsHostBack() == false then
			UIManager.SendMessage("Mainmenu", "SetEnergy", showEnergy)
			UIManager.SendMessage("Mainmenu", "SetEnergyMax", showEnergyMax)
			UIManager.SendMessage("PlayerInfo", "SetSp", nowEnergy, maxEnergy)

			if DebugShowHostHeader then
				UIManager.SendMessage("HeadInfo", "SetEnergy", self.animal:GetAnimalId(), showEnergy)
			end
		end
	else
		UIManager.SendMessage("HeadInfo", "SetEnergy", self.animal:GetAnimalId(), showEnergy)
	end

	if isStart == true or old > 0 and nowEnergy <= 0 or old <= 0 and nowEnergy > 0 then
		if self.animal:IsHost() and self.animal:IsHostBack() == false then
			UIManager.SendMessage("Mainmenu", "ShowEnergyWarning", nowEnergy <= 0, isStart)
		end

		if nowEnergy <= 0 then
			local energyRecoveryTime = self:GetPropertyMax(MS_HeroData.Property.EnergyRecoveryTime)
			local delayTime = Mathf.Clamp(100 - energyRecoveryTime, 0, 100) / 10

			self:SetEnergyRecoveryDelayTime(delayTime)
		end
	end
end

function AnimalBase_Value:RecoveryEnergy()
	local energyRecovery = self:GetPropertyMax(MS_HeroData.Property.EnergyRecovery) / 1000

	if self.animal:IsBlocking() == true then
		energyRecovery = self:GetPropertyMax(MS_HeroData.Property.EnergyRecoveryBlock) / 1000
	end

	energyRecovery = energyRecovery * self:GetPropertyMax(MS_HeroData.Property.Energy)

	self:AddPropertyPeriod(MS_HeroData.Property.Energy, energyRecovery * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:DecrementRage()
	local rageDec = self:GetPropertyMax(MS_HeroData.Property.RageDecrement) / 1000

	rageDec = rageDec * self:GetPropertyMax(MS_HeroData.Property.Rage)

	self:SubPropertyPeriod(MS_HeroData.Property.Rage, rageDec * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:DecrementPower()
	local powerDec = self:GetPropertyMax(MS_HeroData.Property.PowerDecrement) / 1000

	powerDec = powerDec * self:GetPropertyMax(MS_HeroData.Property.Power)

	self:SubPropertyPeriod(MS_HeroData.Property.Power, powerDec * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:RecoveryToughness()
	local toughnessRecovery = self:GetPropertyMax(MS_HeroData.Property.ToughnessRecovery) / 1000

	toughnessRecovery = toughnessRecovery * self:GetPropertyMax(MS_HeroData.Property.Toughness)

	self:AddPropertyPeriod(MS_HeroData.Property.Toughness, toughnessRecovery * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:RecoveryWeakness()
	local weaknessRecovery = self:GetPropertyMax(MS_HeroData.Property.WeaknessRecovery) / 1000

	weaknessRecovery = weaknessRecovery * self:GetPropertyMax(MS_HeroData.Property.Weakness)

	self:AddPropertyPeriod(MS_HeroData.Property.Weakness, weaknessRecovery * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:RecoveryPower()
	local powerRecovery = self:GetPropertyMax(MS_HeroData.Property.PowerRecovery) / 1000

	powerRecovery = powerRecovery * self:GetPropertyMax(MS_HeroData.Property.Power)

	self:AddPropertyPeriod(MS_HeroData.Property.Power, powerRecovery * ControllerMain.GetLogicDeltaTime())
end

function AnimalBase_Value:SubToughness(sub)
	local tmpSub = self:SubProperty(MS_HeroData.Property.Toughness, sub)

	if tmpSub < sub then
		tmpSub = sub - tmpSub

		self:SubPropertySkill(AnimalBase_Value.PropertySkill.Toughness, tmpSub)
	end

	if DebugValueLog == true then
		SystemHelper.LogTest("====Toughness!!!, SubToughness=" .. sub .. ",toughness=" .. self:GetProperty(MS_HeroData.Property.Toughness) .. ",skillToughness=" .. self:GetPropertySkill(AnimalBase_Value.PropertySkill.Toughness) .. ",animalId=" .. self.animal:GetAnimalId())
	end
end

function AnimalBase_Value:CheckToughnessEmpty(sub)
	local tmpToughness = self:GetProperty(MS_HeroData.Property.Toughness)
	local tmpToughnessSkill = self:GetPropertySkill(AnimalBase_Value.PropertySkill.Toughness)

	if sub >= tmpToughness + tmpToughnessSkill then
		return true
	end

	return false
end

function AnimalBase_Value:SetSanPropertyLockCrazy(flg)
	if MS_StoryList.IsStoryMazeStart(self.storyId) == true or MS_StoryList.IsStoryMaze(self.storyId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
		flg = false
	end

	self.sanPropertyLockCrazy = flg
end

function AnimalBase_Value:SetSanPropertyLockBoss(flg)
	self.sanPropertyLockBoss = flg
end

function AnimalBase_Value:GetSanType()
	if self.animal.type ~= AnimalBase_Define.Type.Hero then
		return AnimalBase_Define.SanType.Normal
	end

	local san = self:GetProperty(MS_HeroData.Property.San)
	local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)

	if san <= Mathf.Ceil(sanMax * AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Crazy]) then
		return AnimalBase_Define.SanType.Crazy
	elseif san <= Mathf.Ceil(sanMax * AnimalBase_Value_Define.SanBound[1 + AnimalBase_Define.SanType.Unusual]) then
		return AnimalBase_Define.SanType.Unusual
	else
		if self.animal:IsHost() == true and MS_StoryList.IsStoryCarriage(self.storyId) == false then
			local tmpRet = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.AlwaysSan)

			if tmpRet > 0 then
				return AnimalBase_Define.SanType.Unusual
			end
		end

		return AnimalBase_Define.SanType.Normal
	end
end

function AnimalBase_Value:GetSanPropertyPercent()
	local san = self:GetProperty(MS_HeroData.Property.San)
	local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)

	return san / sanMax
end

function AnimalBase_Value:SetSanPropertyPercentMax(per)
	per = Mathf.Clamp(per, 0, 1)

	local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)
	local sanNew = sanMax * per

	self.property[MS_HeroData.Property.San] = sanNew

	if self.animal:IsHost() and self.animal:IsHostBack() == false and self:GetSanType() == AnimalBase_Define.SanType.Crazy then
		self:SetSanPropertyLockCrazy(true)
	end
end

function AnimalBase_Value:GetSanBound(type)
	local sanMax = self:GetPropertyMax(MS_HeroData.Property.San)

	return sanMax * AnimalBase_Value_Define.SanBound[1 + type]
end

function AnimalBase_Value.GetAttackType(skillData, itemData)
	if itemData ~= nil then
		return itemData.AttackType
	end

	if skillData ~= nil then
		return skillData.AttackType
	end

	return MS_SkillData.AttackType.PhysicDamage
end

function AnimalBase_Value.GetAttackAdd(attackVPlayer, skillData, itemData)
	if itemData ~= nil then
		return itemData.Param1
	end

	if skillData ~= nil then
		return skillData.Attack
	end

	return 0
end

function AnimalBase_Value.GetAttackBase(attackVPlayer, attackType, skillData, itemData)
	attackType = tonumber(attackType)

	local ret = 0

	if attackType == MS_SkillData.AttackType.PhysicDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.PhysicDamage)
	elseif attackType == MS_SkillData.AttackType.FireDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.FireDamage)
	elseif attackType == MS_SkillData.AttackType.PoisonDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.PoisonDamage)
	elseif attackType == MS_SkillData.AttackType.ArcaneDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.ArcaneDamage)
	elseif attackType == MS_SkillData.AttackType.DarkDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.DarkDamage)
	elseif attackType == MS_SkillData.AttackType.PierceDamage then
		ret = attackVPlayer:GetProperty(MS_HeroData.Property.PierceDamage)
	end

	if itemData ~= nil then
		ret = ret * itemData.BaseRate / 1000
	end

	if skillData ~= nil then
		ret = ret * skillData.BaseRate / 1000
	end

	return ret
end

function AnimalBase_Value:GetAttackBaseRatio(attackVPlayer, hitPlayer)
	local hitValue = hitPlayer:GetValue()
	local humanAdd = attackVPlayer:GetProperty(MS_HeroData.Property.HumanAdd)
	local beastAdd = attackVPlayer:GetProperty(MS_HeroData.Property.BeastAdd)
	local sendrilAdd = attackVPlayer:GetProperty(MS_HeroData.Property.SendrilAdd)
	local human = hitValue:GetProperty(MS_HeroData.Property.Human)
	local beast = hitValue:GetProperty(MS_HeroData.Property.Beast)
	local sendril = hitValue:GetProperty(MS_HeroData.Property.Sendril)

	if attackVPlayer:IsHost() == true and (hitPlayer:IsHaveStatusById(MS_StatusData.SanAddRageStatusId1) == true or hitPlayer:IsHaveStatusById(MS_StatusData.SanAddRageStatusId2) == true) and sendril <= 0 then
		local tmpTrophySendril = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.ChangeSendrilProperty)

		if tmpTrophySendril > 0 then
			if human > 0 and beast > 0 then
				beast = 0
				sendril = 1
			elseif human > 0 or beast > 0 then
				human = 0
				beast = 0
				sendril = 1
			end
		end
	end

	if DebugValueLog == true then
		SystemHelper.LogTest("===GetAttackBaseRatio=human=" .. human .. ",beast=" .. beast .. ",sendril=" .. sendril)
		SystemHelper.LogTest("===GetAttackBaseRatio=humanAdd=" .. humanAdd .. ",beastAdd=" .. beastAdd .. ",sendrilAdd=" .. sendrilAdd)
	end

	return humanAdd * human + beastAdd * beast + sendrilAdd * sendril
end

function AnimalBase_Value.GetDefenceType(attackVPlayer, skillData, itemData)
	if itemData ~= nil then
		return itemData.DefenceType
	end

	if skillData ~= nil then
		return skillData.DefenceType
	end

	return MS_SkillData.DefenceType.PhysicResist
end

function AnimalBase_Value.GetDefenceBase(hitValue, defenceType)
	local propertyId = AnimalBase_Value.GetDefenceProperty(defenceType)

	if propertyId > 0 then
		return hitValue:GetPropertyMax(propertyId)
	end

	return 0
end

function AnimalBase_Value.GetDefenceProperty(defenceType)
	defenceType = tonumber(defenceType)

	if defenceType == MS_SkillData.DefenceType.PhysicResist then
		return MS_HeroData.Property.PhysicResist
	elseif defenceType == MS_SkillData.DefenceType.FireResist then
		return MS_HeroData.Property.FireResist
	elseif defenceType == MS_SkillData.DefenceType.PoisonResist then
		return MS_HeroData.Property.PoisonResist
	elseif defenceType == MS_SkillData.DefenceType.ArcaneResist then
		return MS_HeroData.Property.ArcaneResist
	elseif defenceType == MS_SkillData.DefenceType.DarkResist then
		return MS_HeroData.Property.DarkResist
	elseif defenceType == MS_SkillData.DefenceType.PierceResist then
		return MS_HeroData.Property.PierceResist
	end

	return 0
end

function AnimalBase_Value:GetHpDegree()
	local tmpHpMax = self:GetPropertyBase(MS_HeroData.Property.Hp)

	return Mathf.Floor(tmpHpMax / AnimalBase_Value_Define.HP_Divide)
end

function AnimalBase_Value:IsDropDeadArcade(height)
	if height <= AnimalBase_Value_Define.DropDamageSafeHeight then
		return false
	end

	local rate = (height * height - AnimalBase_Value_Define.DropDamageParam1) / AnimalBase_Value_Define.DropDamageParam2

	if rate > 1 then
		rate = 1
	end

	local skillShield = self:GetProperty(MS_HeroData.Property.SkillShield)
	local trophyShield = self:GetProperty(MS_HeroData.Property.TrophyShield)
	local hpBase = self:GetPropertyBase(MS_HeroData.Property.Hp)
	local hpNowAll = self:GetProperty(MS_HeroData.Property.Hp) + skillShield + trophyShield
	local damage = rate * (hpBase + skillShield + trophyShield)

	damage = Mathf.Ceil(damage)

	if hpNowAll <= damage then
		return true
	end

	return false
end

function AnimalBase_Value:IsDropDead(height)
	local param = AnimalBase_Value_Define.DropDamageParam2 + AnimalBase_Value_Define.DropDamageParam1

	if height > 0 and param < height * height then
		return true
	end

	return false
end

function AnimalBase_Value:DamageDrop(height)
	if height <= AnimalBase_Value_Define.DropDamageSafeHeight then
		return 0, 0
	end

	local rate = (height * height - AnimalBase_Value_Define.DropDamageParam1) / AnimalBase_Value_Define.DropDamageParam2

	if rate > 1 then
		rate = 1
	end

	local skillShield = self:GetProperty(MS_HeroData.Property.SkillShield)
	local trophyShield = self:GetProperty(MS_HeroData.Property.TrophyShield)
	local hpBase = self:GetPropertyBase(MS_HeroData.Property.Hp)
	local damage = rate * (hpBase + skillShield + trophyShield)

	damage = Mathf.Ceil(damage)

	local realDamage = self:SubProperty(MS_HeroData.Property.Hp, damage, -1, -1, -1, AnimalBase_Define.DamageReason.Drop)

	return damage, realDamage
end

function AnimalBase_Value:DamageTrickInstant(trickTouchData)
	return self:DamageTrickCommon(trickTouchData)
end

function AnimalBase_Value:DamageTrickPeriod(trickTouchData)
	return self:DamageTrickCommon(trickTouchData)
end

function AnimalBase_Value:DamageTrickCommon(trickTouchData)
	if trickTouchData == nil then
		return 0, 0, 0, 0
	end

	local hitPlayer = trickTouchData:GetHitPlayer()

	if hitPlayer:IsNoDamage() == true then
		return 0, 0, 0, 0, false
	end

	local trickData = trickTouchData:GetTrickData()
	local damageType = trickTouchData:GetDamageType()
	local hitHand = trickTouchData:IsSkillHitHand()
	local hitValue = hitPlayer:GetValue()
	local hitHeroData = MS_HeroData.GetHero(hitPlayer:GetHeroId())
	local attBase = trickData.Damage
	local defBase = AnimalBase_Value.GetDefenceBase(hitValue, trickData.DefenceType)

	if trickData.DefenceType ~= MS_SkillData.DefenceType.PhysicResist and hitPlayer:IsHeroSanNotNormal(10004) == true then
		local tmpSubRate = Hero10004_Define.SanResistSubRate
		local tmpPropertyId = AnimalBase_Value.GetDefenceProperty(trickData.DefenceType)
		local tmpTalentRate = self.sceneController:GetTalentValue(self.animal:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeRate, tmpPropertyId, 0)

		if tmpTalentRate > 0 then
			tmpSubRate = MathHelper.subValuePermil(tmpSubRate, tmpTalentRate)
		end

		defBase = MathHelper.subValuePermil(defBase, tmpSubRate)
	end

	local reduce = 1 - defBase / (defBase + 100)
	local damage = 0

	damage = attBase * reduce

	if damageType == AnimalBase_Define.DamageType.Instant then
		trickTouchData:SetSkillHitHandStatus(TrickTouchData.HitHandStatus.Success)

		if hitHand == false then
			local toughness = trickData.ToughnessSub
			local weakness = trickData.WeaknessSub

			hitValue:SubToughness(toughness)
			hitValue:SubProperty(MS_HeroData.Property.Weakness, weakness)
		else
			local hitHandSkillData = trickTouchData:GetSkillHitHandData()
			local guard = AnimalBase_Value.GetGuard(hitPlayer, hitHandSkillData)
			local guardBreak = trickData.GuardBreak
			local diffRate = AnimalBase_Define.BlockGuardLevelHigh

			if guard > 0 then
				diffRate = (guardBreak - guard) / guard
			end

			local energy = damage * hitHeroData.GuardEnergyRatio * (1 + diffRate)

			if hitPlayer:IsHost() == true then
				local energyMax = hitValue:GetPropertyMax(MS_HeroData.Property.Energy) * AnimalBase_Define.BlockEnergyRateMax

				energy = Mathf.Clamp(energy, 0, energyMax)
			end

			hitValue:SubProperty(MS_HeroData.Property.Energy, energy)

			local guardRatio = hitHeroData.GuardDamageRatio

			if diffRate >= AnimalBase_Define.BlockGuardLevelHigh then
				trickTouchData:SetSkillHitHandStatus(TrickTouchData.HitHandStatus.Fail)
			elseif hitValue:IsHaveSkillEnergy() == false or hitValue:IsWeaknessEmpty() == true or diffRate >= AnimalBase_Define.BlockGuardLevelLow then
				guardRatio = hitHeroData.GuardBreakDamageRatio

				trickTouchData:SetSkillHitHandStatus(TrickTouchData.HitHandStatus.Break)
			elseif diffRate < 0 then
				trickTouchData:SetSkillHitHandStatus(TrickTouchData.HitHandStatus.NoDamage)
			end

			if diffRate > 0 then
				local tmpRadio = Mathf.Clamp(guardRatio * diffRate, 0, 1)

				damage = damage * tmpRadio
			else
				damage = 0
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("====hitHand!!!HitHandSkillIndex=" .. hitHandSkillData.SkillIndex .. ",HitHandSkillCombo=" .. hitHandSkillData.SkillCombo)
				SystemHelper.LogTest("====hitHand!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",damage=" .. damage .. ",energy=" .. energy .. ",guardRatio=" .. guardRatio .. ",diffRate=" .. diffRate)
			end
		end

		if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value.GetCasualDamageRatio()
		end

		if BattleData.isHaveNoobItem() == true and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value_Define.NoobItemDamageRatio
		end

		damage = Mathf.Ceil(damage)
	elseif damageType == AnimalBase_Define.DamageType.Period then
		damage = damage * ControllerMain.GetLogicDeltaTime()

		if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value.GetCasualDamageRatio()
		end

		if BattleData.isHaveNoobItem() == true and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value_Define.NoobItemDamageRatio
		end
	end

	local reason = AnimalBase_Define.DamageReason.None

	if trickData.MustDeath > 0 then
		reason = AnimalBase_Define.DamageReason.MustDeath
	end

	local rage = damage * AnimalBase_Value_Define.RageHitRate
	local realDamage = hitValue:SubProperty(MS_HeroData.Property.Hp, damage, -1, -1, -1, reason)

	hitPlayer:SetSkillLastHitBehind(trickTouchData:IsAttackFromBehind())

	if DebugValueLog == true then
		SystemHelper.LogTest("====damage!!!trick=" .. trickData.TrickId)
		SystemHelper.LogTest("====damage!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",hp=" .. hitValue:GetProperty(MS_HeroData.Property.Hp) .. ",damage=" .. damage)
	end

	return damage, 0, realDamage, 0
end

function AnimalBase_Value:DamageInstant(attackerData)
	local skillAI = attackerData:GetSkillTypeForAI()

	if skillAI == AnimalBase_Define.SkillTypeForAI.Heal then
		return self:HealCommon(attackerData)
	else
		return self:DamageCommon(attackerData)
	end
end

function AnimalBase_Value:DamagePeriod(attackerData)
	local skillAI = attackerData:GetSkillTypeForAI()

	if skillAI == AnimalBase_Define.SkillTypeForAI.Heal then
		return self:HealCommon(attackerData)
	else
		return self:DamageCommon(attackerData)
	end
end

function AnimalBase_Value:DamageCommon(attackerData)
	if attackerData == nil then
		return 0, 0, 0, 0, false
	end

	local hitPlayer = attackerData:GetHitPlayer()

	if hitPlayer:IsNoDamage() == true then
		return 0, 0, 0, 0, false
	end

	local colliderIndexList = attackerData:GetColliderIndexList()
	local damageCnt = 0
	local damage = 0
	local heal = 0
	local realDamage = 0
	local realHeal = 0
	local isWeak = false

	if self.animal.characterColliderWeak == true and colliderIndexList ~= nil and #colliderIndexList > 0 then
		for i = 1, #colliderIndexList do
			local weakIndex = self.animal:GetAnimalColliderWeakIndex(colliderIndexList[i])

			if weakIndex >= 0 then
				local tmpDamage, tmpHeal, tmpRealDamage, tmpRealHeal = self:DamageCommonEach(attackerData, weakIndex)

				damage = damage + tmpDamage
				heal = heal + tmpHeal
				realDamage = realDamage + tmpRealDamage
				realHeal = realHeal + tmpRealHeal
				damageCnt = damageCnt + 1
				isWeak = true
			end
		end
	end

	if damageCnt <= 0 then
		damage, heal, realDamage, realHeal = self:DamageCommonEach(attackerData, -1)
	end

	return damage, heal, realDamage, realHeal, isWeak
end

function AnimalBase_Value:DamageCommonEach(attackerData, colliderWeakIndex)
	if attackerData == nil then
		return 0, 0, 0, 0
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())
	local attackValue

	if attackPlayer ~= nil then
		attackValue = attackPlayer:GetValue()
	end

	local hitPlayer = attackerData:GetHitPlayer()
	local hitHeroData = MS_HeroData.GetHero(hitPlayer:GetHeroId())
	local damageType = attackerData:GetDamageType()
	local hitValue = hitPlayer:GetValue()
	local skillData = attackerData:GetSkillData()
	local itemData = attackerData:GetItemData()
	local attackDis = attackerData:GetAttackDistance()
	local damageAdd = attackerData:GetDamageAdd()
	local attFromBehind = attackerData:IsAttackFromBehind()
	local blocked = attackerData:IsSkillBlocked()
	local hitHand = attackerData:IsSkillHitHand()
	local hitCombo = hitPlayer:GetTouchHitCombo(attackVPlayer)
	local attType = AnimalBase_Value.GetAttackType(skillData, itemData)

	if hitPlayer:IsHost() == true and attType == MS_SkillData.AttackType.PierceDamage then
		local muteki = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.PierceMuteki)

		if muteki > 0 then
			return 0, 0, 0, 0
		end
	end

	if itemData == nil and skillData.Attack <= 0 and skillData.Heal <= 0 and skillData.BaseRate <= 0 then
		return 0, 0, 0, 0
	end

	local addRage = skillData.RageAdd
	local addPower = skillData.PowerAdd
	local subSan = skillData.SanSub
	local subToughness = skillData.ToughnessSub
	local subWeakness = skillData.WeaknessSub

	if itemData ~= nil then
		subToughness = itemData.ToughnessSub
		subWeakness = itemData.WeaknessSub

		if hitPlayer:IsBoss() == true then
			subWeakness = itemData.BossWeaknessSub
		end
	end

	local damageDisMin = skillData.DamageDisMin
	local damageDisMax = skillData.DamageDisMax

	if itemData ~= nil then
		damageDisMin = itemData.DamageDisMin
		damageDisMax = itemData.DamageDisMax
	end

	local disRate = 1

	if damageDisMin > 0 and damageDisMax > 0 and damageDisMin < damageDisMax then
		if attackDis > 0 then
			attackDis = attackDis * hitHeroData.HitDisRate

			if damageDisMax < attackDis then
				disRate = 0
				addRage = 1
				addPower = 1
				subSan = 0
				subToughness = 0
				subWeakness = 0
			elseif attackDis < damageDisMin then
				disRate = 1
			else
				disRate = (attackDis - damageDisMin) / (damageDisMax - damageDisMin)
				disRate = Mathf.Sqrt(1 - disRate * disRate)
				addRage = addRage * disRate
				addPower = addPower * disRate
				subSan = subSan * disRate
				subToughness = subToughness * disRate
				subWeakness = subWeakness * disRate
			end
		end

		if DebugValueLog == true then
			SystemHelper.LogTest("==========damageDisMax==" .. damageDisMax .. ",damageDisMin=" .. damageDisMin .. ",hitHeroData.HitDisRate=" .. hitHeroData.HitDisRate .. ",attackDis=" .. attackDis .. ",disRate=" .. disRate)
		end
	end

	local attBase = AnimalBase_Value.GetAttackBase(attackVPlayer, attType, skillData, itemData)
	local attRatio = self:GetAttackBaseRatio(attackVPlayer, hitPlayer)
	local attAdd = AnimalBase_Value.GetAttackAdd(attackVPlayer, skillData, itemData)

	attBase = MathHelper.addValuePermil(attBase, attRatio) + attAdd

	if DebugValueLog == true then
		SystemHelper.LogTest("=====111=====attBase==" .. attBase .. ",attAdd=" .. attAdd .. ",attRatio=" .. attRatio)
	end

	local defType = AnimalBase_Value.GetDefenceType(attackVPlayer, skillData, itemData)
	local defBase = AnimalBase_Value.GetDefenceBase(hitValue, defType)

	if attackPlayer ~= nil and attackValue ~= nil and attackPlayer:IsHost() == true and itemData == nil then
		local hpMax = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local hpNow = attackValue:GetProperty(MS_HeroData.Property.Hp)

		if hpMax <= hpNow then
			local addAtt = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPMaxAttackAdd)

			if addAtt > 0 then
				attBase = MathHelper.addValuePermil(attBase, addAtt)
			end
		elseif hpNow <= hpMax / 2 then
			local addAtt = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfAttackAdd)

			if addAtt > 0 then
				attBase = MathHelper.addValuePermil(attBase, addAtt)
			end
		end

		local sanType = attackValue:GetSanType()

		if sanType ~= AnimalBase_Define.SanType.Normal then
			local addAtt = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.SanAttackAdd)

			if addAtt > 0 then
				attBase = MathHelper.addValuePermil(attBase, addAtt)
			end
		end
	end

	if hitPlayer:IsHost() == true and itemData == nil then
		local hpMax = hitValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local hpNow = hitValue:GetProperty(MS_HeroData.Property.Hp)

		if hpMax <= hpNow then
			if defType == MS_SkillData.DefenceType.PhysicResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPMaxPhysicResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			elseif defType == MS_SkillData.DefenceType.FireResist or defType == MS_SkillData.DefenceType.PoisonResist or defType == MS_SkillData.DefenceType.ArcaneResist or defType == MS_SkillData.DefenceType.DarkResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPMaxElementResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			end
		elseif hpNow <= hpMax / 2 then
			if defType == MS_SkillData.DefenceType.PhysicResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfPhysicResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			elseif defType == MS_SkillData.DefenceType.FireResist or defType == MS_SkillData.DefenceType.PoisonResist or defType == MS_SkillData.DefenceType.ArcaneResist or defType == MS_SkillData.DefenceType.DarkResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalElementResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			end
		end

		local sanType = hitValue:GetSanType()

		if sanType ~= AnimalBase_Define.SanType.Normal then
			if defType == MS_SkillData.DefenceType.PhysicResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.SanPhysicResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			elseif defType == MS_SkillData.DefenceType.FireResist or defType == MS_SkillData.DefenceType.PoisonResist or defType == MS_SkillData.DefenceType.ArcaneResist or defType == MS_SkillData.DefenceType.DarkResist then
				local addDef = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.SanElementResistAdd)

				if addDef > 0 then
					defBase = MathHelper.addValuePermil(defBase, addDef)
				end
			end
		end
	end

	if DebugValueLog == true then
		SystemHelper.LogTest("====222======attBase==" .. attBase .. ",defBase=" .. defBase)
	end

	local buff = 1
	local att = attBase * buff
	local reduceParam = defBase * buff
	local reduce = 1

	if MathHelper.IsZero(reduceParam) == true then
		reduce = 1
	else
		reduceParam = att / reduceParam

		if reduceParam > 10 then
			reduce = -1 / reduceParam + 1
		elseif reduceParam > 1 then
			reduce = (2 * reduceParam + 7) / 30
		else
			reduce = 0.3
		end
	end

	local damage = 0
	local realDamage = 0

	damage = att * reduce * disRate

	if damage < 1 then
		damage = 1
	end

	if DebugValueLog == true then
		SystemHelper.LogTest("====333333=======reduce==" .. reduce .. ",att=" .. att .. ",disRate=" .. disRate .. ",damage=" .. damage)
	end

	local tmpParamCrit = -1

	if damageType == AnimalBase_Define.DamageType.Instant then
		local retCrit = false
		local damageSub = hitValue:GetPropertySkill(AnimalBase_Value.PropertySkill.DamageSub)

		if colliderWeakIndex >= 0 then
			subToughness = subToughness * (1 + hitHeroData.WeakToughnessMultiplier)
			subWeakness = subWeakness * (1 + hitHeroData.WeakWeaknessMultiplier)
		end

		local tmpTalentWeaknessSub = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillWeaknessSubAdd, skillData.SkillIndexReal, skillData.SkillCombo)

		if tmpTalentWeaknessSub > 0 then
			subWeakness = MathHelper.addValuePermil(subWeakness, tmpTalentWeaknessSub)
		end

		if attackPlayer ~= nil and attackValue ~= nil and attackPlayer:IsHost() == true then
			local rageNow = attackValue:GetProperty(MS_HeroData.Property.Rage)
			local rageMax = attackValue:GetPropertyMax(MS_HeroData.Property.Rage)
			local rageRadio = rageNow / rageMax

			if rageRadio > 0.66 then
				tmpTalentWeaknessSub = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillWeaknessSubBaseOnRageAdd, skillData.SkillIndexReal, skillData.SkillCombo, 2)

				if tmpTalentWeaknessSub > 0 then
					subWeakness = MathHelper.addValuePermil(subWeakness, tmpTalentWeaknessSub)
				end
			elseif rageRadio > 0.33 then
				tmpTalentWeaknessSub = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillWeaknessSubBaseOnRageAdd, skillData.SkillIndexReal, skillData.SkillCombo, 1)

				if tmpTalentWeaknessSub > 0 then
					subWeakness = MathHelper.addValuePermil(subWeakness, tmpTalentWeaknessSub)
				end
			end
		end

		local tmpTalentToughnessSub = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillToughnessSubAdd, skillData.SkillIndexReal, skillData.SkillCombo)

		if tmpTalentToughnessSub > 0 then
			subToughness = subToughness + tmpTalentToughnessSub
		end

		if attFromBehind == false and (blocked == true or hitHand == true) then
			subToughness = 0
		end

		if subToughness > 0 then
			hitValue:SubToughness(subToughness)
		end

		if hitCombo > AnimalBase_Define.SkillTouchHitComboMin then
			local tmpTalentComboWeaknessSubAdd = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillComboWeaknessSubAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentComboWeaknessSubAdd > 0 then
				subWeakness = MathHelper.addValuePermil(subWeakness, tmpTalentComboWeaknessSubAdd)
			end
		end

		if hitValue:IsToughnessEmpty() == true and hitPlayer:GetAnimatorParam(AnimalBase_Define.ParamType.SkillToughness) > 0 then
			if hitHeroData.WeaknessPermilSub > 0 then
				local weaknessMax = hitValue:GetPropertyMax(MS_HeroData.Property.Weakness)

				subWeakness = subWeakness + weaknessMax * hitHeroData.WeaknessPermilSub
			end

			retCrit = true
		end

		if DebugWeaknessUpSelf == true then
			subWeakness = 10000
		end

		if subWeakness > 0 then
			local subWeaknessMax = false

			if (attFromBehind == true or blocked == false or hitHand == false) and attackPlayer ~= nil and attackPlayer:IsHeroSanNotNormal(10004) == true and Hero10004.IsSanSkillWeakness(skillData.SkillIndex, skillData.SkillCombo) == true and hitPlayer:IsBoss() == false then
				local tmpTalentRate = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanSkillWeaknessRate, 0, 0)

				if tmpTalentRate > 0 then
					subWeaknessMax = MathHelper.getRandomResult(tmpTalentRate, attackVPlayer:GetAnimalId() + 1)
				end
			end

			if subWeaknessMax == true then
				hitValue:SetPropertyToZero(MS_HeroData.Property.Weakness)
			else
				if damageSub > 0 then
					subWeakness = MathHelper.subValuePermil(subWeakness, damageSub)
				end

				hitValue:SubProperty(MS_HeroData.Property.Weakness, subWeakness)
			end
		end

		if skillData.CritIgnore <= 0 and retCrit == false then
			local critRate = attackVPlayer:GetProperty(MS_HeroData.Property.CritRate)
			local tmpTalentCritRate = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillCritRateAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentCritRate > 0 then
				critRate = MathHelper.addValuePermil(critRate, tmpTalentCritRate)
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("==111=critRate=" .. critRate .. ",tmpTalentCritRate=" .. tmpTalentCritRate)
			end

			if hitPlayer:IsHaveBloodStatus() == true then
				tmpTalentCritRate = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.StatusBloodCritRateAdd, 0, 0)

				if tmpTalentCritRate > 0 then
					critRate = MathHelper.addValuePermil(critRate, tmpTalentCritRate)
				end

				if DebugValueLog == true then
					SystemHelper.LogTest("==222=critRate=" .. critRate .. ",tmpTalentCritRate=" .. tmpTalentCritRate)
				end
			end

			retCrit = MathHelper.getRandomResult(critRate, attackVPlayer:GetAnimalId())
		end

		if skillData.CritIgnore <= 0 and retCrit == true then
			local critDamage = attackVPlayer:GetProperty(MS_HeroData.Property.CritDamage)
			local tmpTalentCritDamage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillCritDamageAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentCritDamage > 0 then
				critDamage = MathHelper.addValuePermil(critDamage, tmpTalentCritDamage)
			end

			local critResist = hitValue:GetProperty(MS_HeroData.Property.CritResist)

			if critResist > 0 then
				critDamage = critDamage * critResist / 1000
			end

			damage = MathHelper.addValuePermil(damage, critDamage)
			tmpParamCrit = 1

			attackerData:SetCrit(true)

			if attackPlayer ~= nil then
				if attackPlayer:IsHeroSanNotNormal(10002) then
					local tmpTalentSanStatus = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanCritStatusRate, 0, 0)

					if tmpTalentSanStatus > 0 then
						local retCritStatus = MathHelper.getRandomResult(tmpTalentSanStatus, attackVPlayer:GetAnimalId() + 1)

						if retCritStatus == true then
							hitPlayer:AddStatus(attackVPlayer, Hero10002_Define.SanCritStatusId, 0, MS_StatusData.SourceType.San, 0, false)
						end
					end
				end

				if attackValue ~= nil and attackPlayer:IsHost() == true and itemData == nil then
					local addEnergy = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.CriticalEnergyAdd)

					if addEnergy > 0 then
						attackValue:AddProperty(MS_HeroData.Property.Energy, addEnergy)
					end
				end
			end
		end

		attackerData:SetSkillBlockStatus(SkillTouchAttackData.BlockStatus.Success)
		attackerData:SetSkillHitHandStatus(SkillTouchAttackData.HitHandStatus.Success)

		if attFromBehind == true then
			damage = damage * skillData.BackGuardBreak * hitHeroData.BackDamageRate

			if blocked == true then
				attackerData:SetSkillBlockStatus(SkillTouchAttackData.BlockStatus.Fail)
			elseif hitHand == true then
				attackerData:SetSkillHitHandStatus(SkillTouchAttackData.HitHandStatus.Fail)
			end
		elseif blocked == true then
			local blockSkillData, blockParam = attackerData:GetSkillBlockedData()
			local guard = AnimalBase_Value.GetGuard(hitPlayer, blockSkillData)
			local guardBreak = AnimalBase_Value.GetGuardBreak(attackVPlayer, skillData, itemData)
			local diffRate = AnimalBase_Define.BlockGuardLevelHigh

			if guard > 0 then
				diffRate = (guardBreak - guard) / guard
			end

			local energy = damage * hitHeroData.GuardEnergyRatio * (1 + diffRate)
			local tmpTalentGuardEnergy = self.sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillDefenceEnergySub, blockSkillData.SkillIndexReal, blockSkillData.SkillCombo)

			if tmpTalentGuardEnergy > 0 then
				energy = MathHelper.subValuePermil(energy, tmpTalentGuardEnergy)
			end

			if hitPlayer:IsHost() == true then
				local energyMax = hitValue:GetPropertyMax(MS_HeroData.Property.Energy) * AnimalBase_Define.BlockEnergyRateMax

				energy = Mathf.Clamp(energy, 0, energyMax)
			end

			local guardRatio = hitHeroData.GuardDamageRatio

			if blockParam > 1 then
				hitValue:SubProperty(MS_HeroData.Property.Energy, energy, -1, -1, 1)
			else
				hitValue:SubProperty(MS_HeroData.Property.Energy, energy)

				if diffRate >= AnimalBase_Define.BlockGuardLevelHigh then
					attackerData:SetSkillBlockStatus(SkillTouchAttackData.BlockStatus.Fail)
				elseif hitValue:IsHaveSkillEnergy() == false or hitValue:IsWeaknessEmpty() == true or diffRate >= AnimalBase_Define.BlockGuardLevelLow then
					guardRatio = hitHeroData.GuardBreakDamageRatio

					attackerData:SetSkillBlockStatus(SkillTouchAttackData.BlockStatus.Break)
				end
			end

			if diffRate > 0 then
				local tmpRadio = Mathf.Clamp(guardRatio * diffRate, 0, 1)

				damage = damage * tmpRadio
			else
				damage = 0
			end

			if blockParam > 1 then
				damage = damage / 2
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("====block!!!BlockSkillIndex=" .. blockSkillData.SkillIndex .. ",BlockSkillCombo=" .. blockSkillData.SkillCombo)
				SystemHelper.LogTest("====block!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",damage=" .. damage .. ",energy=" .. energy .. ",guardRatio=" .. guardRatio .. ",diffRate=" .. diffRate)
			end
		elseif hitHand == true then
			local hitHandSkillData = attackerData:GetSkillHitHandData()
			local guard = AnimalBase_Value.GetGuard(hitPlayer, hitHandSkillData)
			local guardBreak = AnimalBase_Value.GetGuardBreak(attackVPlayer, skillData, itemData)
			local diffRate = AnimalBase_Define.BlockGuardLevelHigh

			if guard > 0 then
				diffRate = (guardBreak - guard) / guard
			end

			local energy = damage * hitHeroData.GuardEnergyRatio * (1 + diffRate)

			if hitPlayer:IsHost() == true then
				local energyMax = hitValue:GetPropertyMax(MS_HeroData.Property.Energy) * AnimalBase_Define.BlockEnergyRateMax

				energy = Mathf.Clamp(energy, 0, energyMax)
			end

			hitValue:SubProperty(MS_HeroData.Property.Energy, energy)

			local guardRatio = hitHeroData.GuardDamageRatio

			if diffRate >= AnimalBase_Define.BlockGuardLevelHigh then
				attackerData:SetSkillHitHandStatus(SkillTouchAttackData.HitHandStatus.Fail)
			elseif hitValue:IsHaveSkillEnergy() == false or hitValue:IsWeaknessEmpty() == true or diffRate >= AnimalBase_Define.BlockGuardLevelLow then
				guardRatio = hitHeroData.GuardBreakDamageRatio

				attackerData:SetSkillHitHandStatus(SkillTouchAttackData.HitHandStatus.Break)
			elseif diffRate < 0 then
				attackerData:SetSkillHitHandStatus(SkillTouchAttackData.HitHandStatus.NoDamage)
			end

			if diffRate > 0 then
				local tmpRadio = Mathf.Clamp(guardRatio * diffRate, 0, 1)

				damage = damage * tmpRadio
			else
				damage = 0
			end

			if DebugValueLog == true then
				SystemHelper.LogTest("====hitHand!!!HitHandSkillIndex=" .. hitHandSkillData.SkillIndex .. ",HitHandSkillCombo=" .. hitHandSkillData.SkillCombo)
				SystemHelper.LogTest("====hitHand!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",damage=" .. damage .. ",energy=" .. energy .. ",guardRatio=" .. guardRatio .. ",diffRate=" .. diffRate)
			end
		end

		if damageSub > 0 then
			damage = MathHelper.subValuePermil(damage, damageSub)
		end

		if skillData.SkillIndex == AnimalBase_Define.SkillType.Execute and hitPlayer:IsHaveStatusByType(MS_StatusData.LogicType.ExecuteDamageAdd) == true then
			local tmpAdd = hitPlayer:GetStatusSimpleValueByType(MS_StatusData.LogicType.ExecuteDamageAdd)

			damage = MathHelper.addValuePermil(damage, tmpAdd)
		end

		if attackPlayer ~= nil and attackValue ~= nil and attackPlayer:IsHeroSanNotNormal(10003) then
			local nowHp = attackValue:GetProperty(MS_HeroData.Property.Hp)
			local maxHp = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpRate = nowHp * 1000 / maxHp

			if hpRate < Hero10003_Define.SanHpLowRate1 then
				local tmpAddRate = Hero10003_Define.SanHpLowDamageAddRate

				if hpRate < Hero10003_Define.SanHpLowRate2 then
					local tmpTalentAddRate = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanHpLowDamageAddRate, 0, 0)

					if tmpTalentAddRate > 0 then
						tmpAddRate = MathHelper.addValuePermil(tmpAddRate, tmpTalentAddRate)
					end
				end

				damage = MathHelper.addValuePermil(damage, tmpAddRate)
			end
		end

		local tmpTalentDamage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillDamageAdd, skillData.SkillIndexReal, skillData.SkillCombo)

		if tmpTalentDamage > 0 then
			damage = MathHelper.addValuePermil(damage, tmpTalentDamage)
		end

		if colliderWeakIndex >= 0 then
			damage = damage * (1 + hitHeroData.WeakDamageMultiplier)
		end

		if damageAdd > 0 then
			damage = damage + damageAdd
		end

		if DebugValueLog == true then
			SystemHelper.LogTest("===44444=damageAdd=" .. damageAdd .. ",damage=" .. damage)
		end

		if attackPlayer ~= nil and attackValue ~= nil and skillData ~= nil then
			attackValue:SuckHp(skillData, damage, false)

			if attackPlayer:IsHost() == true and itemData == nil and damage > 0 then
				local subHp = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DamageSubHp)

				if subHp > 0 then
					local sub = Mathf.Ceil(damage * subHp / 1000)

					attackValue:SubProperty(MS_HeroData.Property.Hp, sub, -1, -1, 1)
				end

				local suckHp = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DamageSuckHp)

				if suckHp > 0 then
					local add = Mathf.Ceil(damage * suckHp / 1000)

					attackValue:AddProperty(MS_HeroData.Property.Hp, add)
				end
			end

			if attackPlayer:IsHaveStatusByType(MS_StatusData.LogicType.SuckHp) == true then
				local suckHp = attackPlayer:GetStatusSimpleValueByType(MS_StatusData.LogicType.SuckHp)

				if suckHp > 0 then
					local add = Mathf.Ceil(damage * suckHp / 1000)

					attackValue:AddProperty(MS_HeroData.Property.Hp, add)
				end
			end
		end

		if hitPlayer:GetHeroExtGetHitTeamId() > 0 and attackVPlayer:GetTeamId() ~= hitPlayer:GetHeroExtGetHitTeamId() then
			damage = 0
		end

		if DebugDontDamageSelf == true and hitPlayer:IsHost() == true then
			damage = 0
		end

		if DebugDamageUpSelf == true and attackVPlayer:IsHost() == true then
			damage = damage * 100
		end

		if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value.GetCasualDamageRatio()
		end

		if BattleData.isHaveNoobItem() == true and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value_Define.NoobItemDamageRatio
		end

		if damage > 0 then
			local tmpTalentHitRage = self.sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.HitAddRage, 0, 0)

			if tmpTalentHitRage > 0 then
				local hitAddRage = skillData.RageAddHit * tmpTalentHitRage / 1000
				local hpMax = hitValue:GetPropertyMax(MS_HeroData.Property.Hp)
				local hpNow = hitValue:GetProperty(MS_HeroData.Property.Hp)

				if hpNow <= hpMax * 0.3 then
					local retRage = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfRageAdd)

					if retRage > 0 then
						hitAddRage = MathHelper.addValuePermil(hitAddRage, retRage)
					end
				end

				hitValue:AddProperty(MS_HeroData.Property.Rage, hitAddRage)
			end

			local tmpTalentHitPower = self.sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.HitAddPower, 0, 0)

			if tmpTalentHitPower > 0 then
				local hitAddPower = skillData.PowerAddHit * tmpTalentHitPower / 1000

				hitValue:AddProperty(MS_HeroData.Property.Power, hitAddPower)
			end
		end

		damage = Mathf.Ceil(damage)

		if DebugValueLog == true then
			SystemHelper.LogTest("===55555=damage=" .. damage)
		end

		if DebugPropertyMax == false and attackValue ~= nil then
			if attackPlayer:IsHeroSanNotNormal(10005) == true and addRage > 0 and (hitPlayer:IsHaveStatusById(MS_StatusData.SanAddRageStatusId1) == true or hitPlayer:IsHaveStatusById(MS_StatusData.SanAddRageStatusId2) == true) then
				local tmpAddRageRate = MS_StatusData.SanAddRageRate
				local tmpTalentRage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanDarkStatusRageAdd, 0, 0)

				if tmpTalentRage > 0 then
					tmpAddRageRate = MathHelper.addValuePermil(tmpAddRageRate, tmpTalentRage)
				end

				addRage = MathHelper.addValuePermil(addRage, tmpAddRageRate)
			end

			local tmpTalentRage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillRageAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentRage > 0 then
				addRage = addRage + tmpTalentRage
			end

			local hpMax = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpNow = attackValue:GetProperty(MS_HeroData.Property.Hp)

			if hpNow <= hpMax * 0.3 then
				local retRage = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfRageAdd)

				if retRage > 0 then
					addRage = MathHelper.addValuePermil(addRage, retRage)
				end
			end

			attackValue:AddProperty(MS_HeroData.Property.Rage, addRage)

			local tmpTalentPower = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillPowerAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentPower > 0 then
				addPower = addPower + tmpTalentPower
			end

			attackValue:AddProperty(MS_HeroData.Property.Power, addPower)
		end

		if hitValue ~= nil then
			if DebugSanUp == true then
				subSan = 30
			end

			if subSan > 0 then
				if hitPlayer:IsHost() == true then
					local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.ResistSubSan)

					if ret > 0 then
						subSan = subSan * 0.5
					end
				end

				hitValue:SubProperty(MS_HeroData.Property.San, subSan)
			end
		end

		local reason = AnimalBase_Define.DamageReason.None

		if skillData.MustDeath > 0 then
			reason = AnimalBase_Define.DamageReason.MustDeath
		end

		realDamage = hitValue:SubProperty(MS_HeroData.Property.Hp, damage, tmpParamCrit, colliderWeakIndex, -1, reason)
	elseif damageType == AnimalBase_Define.DamageType.Period then
		if attackPlayer ~= nil and attackValue ~= nil and attackPlayer:IsHeroSanNotNormal(10003) then
			local nowHp = attackValue:GetProperty(MS_HeroData.Property.Hp)
			local maxHp = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpRate = nowHp * 1000 / maxHp

			if hpRate < Hero10003_Define.SanHpLowRate1 then
				local tmpAddRate = Hero10003_Define.SanHpLowDamageAddRate

				if hpRate < Hero10003_Define.SanHpLowRate2 then
					local tmpTalentAddRate = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SanHpLowDamageAddRate, 0, 0)

					if tmpTalentAddRate > 0 then
						tmpAddRate = MathHelper.addValuePermil(tmpAddRate, tmpTalentAddRate)
					end
				end

				damage = MathHelper.addValuePermil(damage, tmpAddRate)
			end
		end

		local tmpTalentDamage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillDamageAdd, skillData.SkillIndexReal, skillData.SkillCombo)

		if tmpTalentDamage > 0 then
			damage = MathHelper.addValuePermil(damage, tmpTalentDamage)
		end

		if colliderWeakIndex >= 0 then
			damage = damage * (1 + hitHeroData.WeakDamageMultiplier)
		end

		if damageAdd > 0 then
			damage = damage + damageAdd
		end

		if DebugValueLog == true then
			SystemHelper.LogTest("===666666=damageAdd=" .. damageAdd .. ",damage=" .. damage)
		end

		if hitPlayer:GetHeroExtGetHitTeamId() > 0 and attackVPlayer:GetTeamId() ~= hitPlayer:GetHeroExtGetHitTeamId() then
			damage = 0
		end

		if DebugDontDamageSelf == true and hitPlayer:IsHost() == true then
			damage = 0
		end

		if DebugDamageUpSelf == true and attackVPlayer:IsHost() == true then
			damage = damage * 100
		end

		damage = damage * ControllerMain.GetLogicDeltaTime()

		if attackPlayer ~= nil and attackValue ~= nil and skillData ~= nil then
			attackValue:SuckHp(skillData, damage, true)

			if attackPlayer:IsHost() == true and itemData == nil and damage > 0 then
				local subHp = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DamageSubHp)

				if subHp > 0 then
					local sub = Mathf.Ceil(damage * subHp / 1000)

					attackValue:SubPropertyPeriod(MS_HeroData.Property.Hp, sub, -1, -1, 1)
				end

				local suckHp = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DamageSuckHp)

				if suckHp > 0 then
					local add = Mathf.Ceil(damage * suckHp / 1000)

					attackValue:AddPropertyPeriod(MS_HeroData.Property.Hp, add)
				end
			end
		end

		if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value.GetCasualDamageRatio()
		end

		if BattleData.isHaveNoobItem() == true and hitPlayer:IsHost() == true then
			damage = damage * AnimalBase_Value_Define.NoobItemDamageRatio
		end

		if DebugValueLog == true then
			SystemHelper.LogTest("===777777=damage=" .. damage)
		end

		if damage > 0 then
			local tmpTalentHitRage = self.sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.HitAddRage, 0, 0)

			if tmpTalentHitRage > 0 then
				local hitAddRage = skillData.RageAddHit * tmpTalentHitRage / 1000

				hitValue:AddPropertyPeriod(MS_HeroData.Property.Rage, hitAddRage * ControllerMain.GetLogicDeltaTime())
			end

			local tmpTalentHitPower = self.sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.HitAddPower, 0, 0)

			if tmpTalentHitPower > 0 then
				local hitAddPower = skillData.PowerAddHit * tmpTalentHitPower / 1000

				hitValue:AddPropertyPeriod(MS_HeroData.Property.Power, hitAddPower * ControllerMain.GetLogicDeltaTime())
			end
		end

		if DebugPropertyMax == false and attackValue ~= nil then
			local tmpTalentRage = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillRageAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentRage > 0 then
				addRage = addRage + tmpTalentRage
			end

			attackValue:AddPropertyPeriod(MS_HeroData.Property.Rage, addRage * ControllerMain.GetLogicDeltaTime())

			local tmpTalentPower = self.sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillPowerAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentPower > 0 then
				addPower = addPower + tmpTalentPower
			end

			attackValue:AddPropertyPeriod(MS_HeroData.Property.Power, addPower * ControllerMain.GetLogicDeltaTime())
		end

		if hitValue ~= nil then
			if DebugSanUp == true then
				subSan = 30
			end

			if subSan > 0 then
				if hitPlayer:IsHost() == true then
					local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.ResistSubSan)

					if ret > 0 then
						subSan = subSan * 0.5
					end
				end

				hitValue:SubPropertyPeriod(MS_HeroData.Property.San, subSan * ControllerMain.GetLogicDeltaTime())
			end
		end

		realDamage = hitValue:SubPropertyPeriod(MS_HeroData.Property.Hp, damage, tmpParamCrit, colliderWeakIndex, -1)
	end

	hitPlayer:SetSkillLastHitBehind(attFromBehind)

	if DebugValueLog == true then
		SystemHelper.LogTest("====damage!!!SkillIndex=" .. skillData.SkillIndex .. ",SkillCombo=" .. skillData.SkillCombo)
		SystemHelper.LogTest("====damage!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",hp=" .. hitValue:GetProperty(MS_HeroData.Property.Hp) .. ",hitCombo=" .. hitCombo .. ",damage=" .. damage)
	end

	return damage, 0, realDamage, 0
end

function AnimalBase_Value:HealCommon(attackerData)
	if attackerData == nil then
		return 0, 0, 0, 0, false
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local attackPlayer = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())
	local attackValue

	if attackPlayer ~= nil then
		attackValue = attackPlayer:GetValue()
	end

	local hitPlayer = attackerData:GetHitPlayer()
	local hitValue = hitPlayer:GetValue()
	local skillData = attackerData:GetSkillData()
	local heal = AnimalBase_Value.GetAttackBase(attackVPlayer, skillData.AttackType, skillData, nil)

	heal = heal + skillData.Heal

	local damageType = attackerData:GetDamageType()
	local realHeal = 0

	if damageType == AnimalBase_Define.DamageType.Instant then
		heal = Mathf.Ceil(heal)

		if DebugPropertyMax == false and attackValue ~= nil then
			local addRage = skillData.RageAdd
			local hpMax = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpNow = attackValue:GetProperty(MS_HeroData.Property.Hp)

			if hpNow <= hpMax * 0.3 then
				local retRage = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfRageAdd)

				if retRage > 0 then
					addRage = MathHelper.addValuePermil(addRage, retRage)
				end
			end

			attackValue:AddProperty(MS_HeroData.Property.Rage, addRage)
			attackValue:AddProperty(MS_HeroData.Property.Power, skillData.PowerAdd)
		end

		if self.animal:IsHeroSanNotNormal(10003) == true and (self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId1) == true or self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId2) == true or self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId3) == true) then
			heal = MathHelper.subValuePermil(heal, Hero10003_Define.SanItemValueSubRate)
		end

		realHeal = hitValue:AddProperty(MS_HeroData.Property.Hp, heal)
	elseif damageType == AnimalBase_Define.DamageType.Period then
		heal = heal * ControllerMain.GetLogicDeltaTime()

		if DebugPropertyMax == false and attackValue ~= nil then
			local addRage = skillData.RageAdd * ControllerMain.GetLogicDeltaTime()
			local hpMax = attackValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hpNow = attackValue:GetProperty(MS_HeroData.Property.Hp)

			if hpNow <= hpMax * 0.3 then
				local retRage = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.HPHalfRageAdd)

				if retRage > 0 then
					addRage = MathHelper.addValuePermil(addRage, retRage)
				end
			end

			attackValue:AddProperty(MS_HeroData.Property.Rage, addRage)
			attackValue:AddProperty(MS_HeroData.Property.Power, skillData.PowerAdd * ControllerMain.GetLogicDeltaTime())
		end

		if self.animal:IsHeroSanNotNormal(10003) == true and (self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId1) == true or self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId2) == true or self.animal:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId3) == true) then
			heal = MathHelper.subValuePermil(heal, Hero10003_Define.SanItemValueSubRate)
		end

		realHeal = hitValue:AddPropertyPeriod(MS_HeroData.Property.Hp, heal)
	end

	if DebugValueLog == true then
		SystemHelper.LogTest("====heal!!!SkillIndex=" .. skillData.SkillIndex .. ",SkillCombo=" .. skillData.SkillCombo)
		SystemHelper.LogTest("====heal!!!AnimalId=" .. hitPlayer:GetAnimalId() .. ",hp=" .. hitValue:GetProperty(MS_HeroData.Property.Hp) .. ",heal=" .. heal)
	end

	return 0, heal, 0, realHeal, false
end

function AnimalBase_Value.GetGuard(hitPlayer, blockSkillData)
	local guard = blockSkillData.Guard

	if guard > 0 then
		local sceneController = ST_Main.GetSceneController()

		if sceneController ~= nil then
			local tmpTalentGuard = sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillGuardAdd, blockSkillData.SkillIndexReal, blockSkillData.SkillCombo)

			if tmpTalentGuard > 0 then
				guard = MathHelper.addValuePermil(guard, tmpTalentGuard)
			end

			if hitPlayer:IsHeroSanNotNormal(10001) then
				local tmpCrazyTalentGuard = sceneController:GetTalentValue(hitPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillSanGuardAdd, blockSkillData.SkillIndexReal, blockSkillData.SkillCombo)

				if tmpCrazyTalentGuard > 0 then
					guard = MathHelper.addValuePermil(guard, tmpCrazyTalentGuard)
				end
			end
		end
	end

	if hitPlayer:IsHaveStatusByType(MS_StatusData.LogicType.GuardAdd) == true then
		guard = 999
	end

	return guard
end

function AnimalBase_Value.GetGuardBreak(attackVPlayer, skillData, itemData)
	local guardBreak = skillData.GuardBreak

	if itemData ~= nil then
		guardBreak = itemData.GuardBreak
	end

	if guardBreak > 0 then
		local sceneController = ST_Main.GetSceneController()

		if sceneController ~= nil then
			local tmpTalentGuardBreak = sceneController:GetTalentValue(attackVPlayer:GetAnimalId(), MS_HeroTalent.Type.SkillGuardBreakAdd, skillData.SkillIndexReal, skillData.SkillCombo)

			if tmpTalentGuardBreak > 0 then
				guardBreak = guardBreak + tmpTalentGuardBreak
			end
		end
	end

	return guardBreak
end

function AnimalBase_Value:SuckHp(skillData, damage, isPeriod)
	if damage <= 0 or skillData == nil then
		return 0
	end

	local suck = skillData.SuckHp

	if suck > 0 then
		local addHp = Mathf.Ceil(damage * suck / 1000)

		if DebugValueLog == true then
			SystemHelper.LogTest("=======SuckHp===addHp========" .. addHp)
		end

		if isPeriod == false then
			self:AddProperty(MS_HeroData.Property.Hp, addHp)
		else
			self:AddPropertyPeriod(MS_HeroData.Property.Hp, addHp)
		end

		return addHp
	end

	return 0
end

function AnimalBase_Value:SetDamageAdd(add)
	self.damageAdd = add
end

function AnimalBase_Value:GetDamageAdd()
	return self.damageAdd
end

function AnimalBase_Value:ResetDamageAdd()
	self.damageAdd = 0
end

function AnimalBase_Value.GetCasualDamageRatio()
	if AppVer == AppTapTapCloudDemo then
		return AnimalBase_Value_Define.CasualDamageRatioCloud
	end

	return AnimalBase_Value_Define.CasualDamageRatio
end

function AnimalBase_Value.GetCasualToughnessAdd()
	if AppVer == AppTapTapCloudDemo then
		return AnimalBase_Value_Define.CasualToughnessAddCloud
	end

	return AnimalBase_Value_Define.CasualToughnessAdd
end

function AnimalBase_Value.GetCasualEnergyRatio()
	if AppVer == AppTapTapCloudDemo then
		return AnimalBase_Value_Define.CasualEnergyRatioCloud
	end

	return AnimalBase_Value_Define.CasualEnergyRatio
end

function AnimalBase_Value:Exit()
	self.animal = nil
	self.heroId = 0
	self.property = nil
	self.propertyMax = nil
	self.propertyMaxDiff = nil
	self.propertyMaxDiffOld = nil
	self.propertyBase = nil
	self.heroData = nil
	self.propertySkill = nil
	self.propertyLockMin = nil
	self.heroPropertyData = nil
end

return AnimalBase_Value
