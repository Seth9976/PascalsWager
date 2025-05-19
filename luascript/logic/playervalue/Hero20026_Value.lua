-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20026_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20026_Value = class("Hero20026_Value", AnimalBase_Value)

function Hero20026_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20026_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20026_Value
