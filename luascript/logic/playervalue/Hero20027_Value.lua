-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20027_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20027_Value = class("Hero20027_Value", AnimalBase_Value)
Hero20027_Value.static.GradeUpHpRate = 0.1

function Hero20027_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20027_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20027_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20027_Value
