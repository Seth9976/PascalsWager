-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20028_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20028_Value = class("Hero20028_Value", AnimalBase_Value)

function Hero20028_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20028_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20028_Value
