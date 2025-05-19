-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90005_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90005_Value = class("Hero90005_Value", AnimalBase_Value)

function Hero90005_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90005_Value:DamageInstant(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamageInstant(self, attackerData)

	if self.animal:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.animal.callFromAnimalId > 0 and self.animal.callFromHeroId == AnimalBase_Define.CallHost_20027 then
		local fromPlayer = self.sceneController:FindPlayerById(self.animal.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:GetValue():SubProperty(MS_HeroData.Property.Hp, hpSubReal, -1, -1, -1)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero90005_Value:DamagePeriod(attackerData)
	local hpSub, hpAdd, hpSubReal, hpAddReal, isWeak = AnimalBase_Value.DamagePeriod(self, attackerData)

	if self.animal:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.animal.callFromAnimalId > 0 and self.animal.callFromHeroId == AnimalBase_Define.CallHost_20027 then
		local fromPlayer = self.sceneController:FindPlayerById(self.animal.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:GetValue():SubProperty(MS_HeroData.Property.Hp, hpSubReal, -1, -1, -1)
		end
	end

	return hpSub, hpAdd, hpSubReal, hpAddReal, isWeak
end

function Hero90005_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90005_Value
