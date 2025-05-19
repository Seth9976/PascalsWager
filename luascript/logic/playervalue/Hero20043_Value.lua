-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20043_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20043_Value = class("Hero20043_Value", AnimalBase_Value)

function Hero20043_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20043_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20043_Value
