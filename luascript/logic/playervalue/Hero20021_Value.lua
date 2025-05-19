-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20021_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20021_Value = class("Hero20021_Value", AnimalBase_Value)

function Hero20021_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20021_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20021_Value
