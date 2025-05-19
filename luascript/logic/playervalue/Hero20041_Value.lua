-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20041_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20041_Value = class("Hero20041_Value", AnimalBase_Value)

function Hero20041_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20041_Value:DamageInstant(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamageInstant(self, attackerData)

	if hpSubReal > 0 then
		self.animal:HandleDamage(hpSubReal)
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20041_Value:DamagePeriod(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamagePeriod(self, attackerData)

	if hpSubReal > 0 then
		self.animal:HandleDamage(hpSubReal)
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero20041_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20041_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20041_Value
