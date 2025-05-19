-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20056_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20056_Value = class("Hero20056_Value", AnimalBase_Value)

function Hero20056_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20056_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20056_Value
