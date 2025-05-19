-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20053_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20053_Value = class("Hero20053_Value", AnimalBase_Value)

function Hero20053_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)

	self.weakHpMax = 0
	self.weakHp = 0
end

function Hero20053_Value:Start()
	AnimalBase_Value.Start(self)

	local max = self:GetPropertyMax(MS_HeroData.Property.Hp)

	self.weakHpMax = max * Hero20053_Define.WeakHpPercent
	self.weakHp = self.weakHpMax
end

function Hero20053_Value:DamageInstant(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamageInstant(self, attackerData)

	if self.weakEnable == true and isWeak == true and hpSubReal > 0 then
		self.weakHp = self.weakHp - hpSubReal
		self.weakHp = Mathf.Clamp(self.weakHp, 0, self.weakHpMax)

		if self.weakHp <= 0 then
			self.weakEnable = false

			self.animal:SetWeakEnable(self.weakEnable)
		end

		log("========self.weakHp=======" .. self.weakHp)
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20053_Value:DamagePeriod(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamagePeriod(self, attackerData)

	if self.weakEnable == true and isWeak == true and hpSubReal > 0 then
		self.weakHp = self.weakHp - hpSubReal
		self.weakHp = Mathf.Clamp(self.weakHp, 0, self.weakHpMax)

		if self.weakHp <= 0 then
			self.weakEnable = false

			self.animal:SetWeakEnable(self.weakEnable)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20053_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20053_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20053_Value
