-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20018_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20018_Value = class("Hero20018_Value", AnimalBase_Value)

function Hero20018_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20018_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20018_Value
