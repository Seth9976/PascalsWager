-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20044_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20044_Value = class("Hero20044_Value", AnimalBase_Value)

function Hero20044_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20044_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20044_Value
