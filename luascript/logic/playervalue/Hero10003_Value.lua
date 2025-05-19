-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10003_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10003_Value = class("Hero10003_Value", AnimalBase_Value)

function Hero10003_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)

	self.bottleWater = {}
	self.bottleWater[Hero10003_Define.BottleType.Rage] = 0
	self.bottleWater[Hero10003_Define.BottleType.Power] = 0
	self.bottleMaterial = {}

	local bottleRender1 = self.animal:GetEquipmentRender(6)

	if bottleRender1 ~= nil then
		self.bottleMaterial[Hero10003_Define.BottleType.Rage] = bottleRender1.sharedMaterial

		self.bottleMaterial[Hero10003_Define.BottleType.Rage]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Rage, 0)
	end

	local bottleRender2 = self.animal:GetEquipmentRender(5)

	if bottleRender2 ~= nil then
		self.bottleMaterial[Hero10003_Define.BottleType.Power] = bottleRender2.sharedMaterial

		self.bottleMaterial[Hero10003_Define.BottleType.Power]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Power, 0)
	end

	bottleRender1 = nil
	bottleRender2 = nil
end

function Hero10003_Value:Update()
	AnimalBase_Value.Update(self)

	local rage = self:GetProperty(MS_HeroData.Property.Rage)
	local rageMax = self:GetPropertyMax(MS_HeroData.Property.Rage)
	local power = self:GetProperty(MS_HeroData.Property.Power)
	local powerMax = self:GetPropertyMax(MS_HeroData.Property.Power)
	local rageRate = Mathf.Ceil(rage * 100 / rageMax) / 100
	local powerRate = Mathf.Ceil(power * 100 / powerMax) / 100

	if MathHelper.Approximately(rageRate, self.bottleWater[Hero10003_Define.BottleType.Rage]) == false then
		if self.bottleMaterial[Hero10003_Define.BottleType.Rage] ~= nil then
			self.bottleMaterial[Hero10003_Define.BottleType.Rage]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Rage, rageRate)
		end

		self.bottleWater[Hero10003_Define.BottleType.Rage] = rageRate
	end

	if MathHelper.Approximately(powerRate, self.bottleWater[Hero10003_Define.BottleType.Power]) == false then
		if self.bottleMaterial[Hero10003_Define.BottleType.Power] ~= nil then
			self.bottleMaterial[Hero10003_Define.BottleType.Power]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Power, powerRate)
		end

		self.bottleWater[Hero10003_Define.BottleType.Power] = powerRate
	end
end

function Hero10003_Value:ResetBottle()
	self.bottleWater[Hero10003_Define.BottleType.Rage] = 0

	if self.bottleMaterial[Hero10003_Define.BottleType.Rage] ~= nil then
		self.bottleMaterial[Hero10003_Define.BottleType.Rage]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Rage, 0)
	end

	self.bottleWater[Hero10003_Define.BottleType.Power] = 0

	if self.bottleMaterial[Hero10003_Define.BottleType.Power] ~= nil then
		self.bottleMaterial[Hero10003_Define.BottleType.Power]:SetFloat("_Fill" .. Hero10003_Define.BottleType.Power, 0)
	end
end

function Hero10003_Value:SwitchBottle(status)
	if self.bottleMaterial[Hero10003_Define.BottleType.Power] ~= nil then
		self.bottleMaterial[Hero10003_Define.BottleType.Power]:SetFloat("_SwitchTex", status - 1)
	end
end

function Hero10003_Value:SuckHp(skillData, damage, isPeriod)
	if damage <= 0 or skillData == nil then
		return 0
	end

	local suck = skillData.SuckHp
	local status1 = self.animal:GetStatusById(Hero10003_Define.StatusSuckHp1)
	local status2 = self.animal:GetStatusById(Hero10003_Define.StatusSuckHp2)
	local status3 = self.animal:GetStatusById(Hero10003_Define.StatusSuckHp3)

	if status1 ~= nil then
		suck = suck + status1:GetSimpleValue()
	end

	if status2 ~= nil then
		suck = suck + status2:GetSimpleValue()
	end

	if status3 ~= nil then
		suck = suck + status3:GetSimpleValue()
	end

	if suck > 0 then
		local addHp = Mathf.Ceil(damage * suck / 1000)

		if isPeriod == false then
			local maxHp = self:GetPropertyMax(MS_HeroData.Property.Hp)

			addHp = Mathf.Min(addHp, Hero10003_Define.SuckHpMaxRatio * maxHp)

			self:AddProperty(MS_HeroData.Property.Hp, addHp)
		else
			self:AddPropertyPeriod(MS_HeroData.Property.Hp, addHp)
		end

		return addHp
	end

	return 0
end

function Hero10003_Value:CalculateDamageAdd()
	local trophyShield = self:GetProperty(MS_HeroData.Property.TrophyShield)
	local skillShield = self:GetProperty(MS_HeroData.Property.SkillShield)

	self:SetDamageAdd(trophyShield + skillShield)
end

function Hero10003_Value:Exit()
	self.bottleWater = nil
	self.bottleMaterial = nil

	AnimalBase_Value.Exit(self)
end

return Hero10003_Value
