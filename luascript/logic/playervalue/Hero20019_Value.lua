-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20019_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20019_Value = class("Hero20019_Value", AnimalBase_Value)

function Hero20019_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20019_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20019_Value
