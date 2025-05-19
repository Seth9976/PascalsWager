-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20025_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20025_Value = class("Hero20025_Value", AnimalBase_Value)

function Hero20025_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20025_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20025_Value
