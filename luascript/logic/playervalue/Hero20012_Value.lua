-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20012_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20012_Value = class("Hero20012_Value", AnimalBase_Value)

function Hero20012_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20012_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20012_Value
