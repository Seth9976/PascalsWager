-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20042_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20042_Value = class("Hero20042_Value", AnimalBase_Value)

function Hero20042_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20042_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20042_Value
