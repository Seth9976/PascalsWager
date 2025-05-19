-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20036_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20036_Value = class("Hero20036_Value", AnimalBase_Value)

function Hero20036_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20036_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20036_Value
