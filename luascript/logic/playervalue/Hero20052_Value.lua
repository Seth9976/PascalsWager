-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20052_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20052_Value = class("Hero20052_Value", AnimalBase_Value)

function Hero20052_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20052_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20052_Value
