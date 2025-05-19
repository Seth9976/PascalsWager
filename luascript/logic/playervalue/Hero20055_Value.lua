-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20055_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20055_Value = class("Hero20055_Value", AnimalBase_Value)

function Hero20055_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)

	self.barrelHpMax = 0
	self.barrelHp = 0
end

function Hero20055_Value:Start()
	AnimalBase_Value.Start(self)

	local max = self:GetPropertyMax(MS_HeroData.Property.Hp)

	self.barrelHpMax = max * Hero20055_Define.BarrelHpPercent
	self.barrelHp = self.barrelHpMax
end

function Hero20055_Value:ResetBarrelHp()
	self.barrelHp = self.barrelHpMax
end

function Hero20055_Value:DamageInstant(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamageInstant(self, attackerData)

	if isWeak == true and hpSubReal > 0 and self.animal:IsPermitAttackBarrel() == true then
		self.barrelHp = self.barrelHp - hpSubReal
		self.barrelHp = Mathf.Clamp(self.barrelHp, 0, self.barrelHpMax)

		SystemHelper.LogTest("========self.barrelHp=======" .. self.barrelHp)

		if self.barrelHp <= 0 then
			self:SetPropertyToZero(MS_HeroData.Property.Weakness)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20055_Value:DamagePeriod(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamagePeriod(self, attackerData)

	if isWeak == true and hpSubReal > 0 and self.animal:IsPermitAttackBarrel() == true then
		self.barrelHp = self.barrelHp - hpSubReal
		self.barrelHp = Mathf.Clamp(self.barrelHp, 0, self.barrelHpMax)

		if self.barrelHp <= 0 then
			self:SetPropertyToZero(MS_HeroData.Property.Weakness)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20055_Value:IsBarrelHpEmpty()
	if self.barrelHp <= 0 then
		return true
	end

	return false
end

function Hero20055_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20055_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20055_Value
