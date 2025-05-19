-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20051_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20051_Value = class("Hero20051_Value", AnimalBase_Value)

function Hero20051_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20051_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20051_Value
