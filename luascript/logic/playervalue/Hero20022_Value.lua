-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20022_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20022_Value = class("Hero20022_Value", AnimalBase_Value)
Hero20022_Value.static.GradeUpHpRate = 0.5

function Hero20022_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20022_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20022_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20022_Value
