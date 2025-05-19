-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20034_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20034_Value = class("Hero20034_Value", AnimalBase_Value)

function Hero20034_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)

	self.weakHpMax = 0
	self.weakHp = 0
end

function Hero20034_Value:Start()
	AnimalBase_Value.Start(self)

	local max = self:GetPropertyMax(MS_HeroData.Property.Hp)

	self.weakHpMax = max * Hero20034_Define.WeakHpPercent
	self.weakHp = self.weakHpMax
	self.weakRecoveryTime = 0
end

function Hero20034_Value:DamageInstant(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamageInstant(self, attackerData)

	if self.weakEnable == true and isWeak == true and hpSubReal > 0 then
		self.weakHp = self.weakHp - hpSubReal
		self.weakHp = Mathf.Clamp(self.weakHp, 0, self.weakHpMax)

		if self.weakHp <= 0 then
			self.weakRecoveryTime = TimeHelper.getNowTime() + Hero20034_Define.WeakHpRecoveryTime
			self.weakEnable = false

			self.animal:SetWeakEnable(self.weakEnable)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20034_Value:DamagePeriod(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamagePeriod(self, attackerData)

	if self.weakEnable == true and isWeak == true and hpSubReal > 0 then
		self.weakHp = self.weakHp - hpSubReal
		self.weakHp = Mathf.Clamp(self.weakHp, 0, self.weakHpMax)

		if self.weakHp <= 0 then
			self.weakRecoveryTime = TimeHelper.getNowTime() + Hero20034_Define.WeakHpRecoveryTime
			self.weakEnable = false

			self.animal:SetWeakEnable(self.weakEnable)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20034_Value:Update()
	AnimalBase_Value.Update(self)

	if self.weakEnable == false then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.weakRecoveryTime then
			self.weakHp = self.weakHpMax
			self.weakEnable = true

			self.animal:SetWeakEnable(self.weakEnable)
		end
	end
end

function Hero20034_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20034_Value
