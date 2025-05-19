-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10004_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10004_Value = class("Hero10004_Value", AnimalBase_Value)

function Hero10004_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10004_Value:Update()
	AnimalBase_Value.Update(self)

	if self.animal:IsDead() == false and self.animal:GetGrade() > 1 then
		self:DecrementRage()

		local nowRage = self:GetProperty(MS_HeroData.Property.Rage)

		if nowRage <= 0 then
			self.animal:ResetGrade()
		end
	end
end

function Hero10004_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10004_Value
