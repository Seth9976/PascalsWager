-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20040_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20040_Value = class("Hero20040_Value", AnimalBase_Value)

function Hero20040_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20040_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20040_Value
