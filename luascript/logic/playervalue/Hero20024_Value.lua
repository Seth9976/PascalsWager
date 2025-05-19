-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20024_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20024_Value = class("Hero20024_Value", AnimalBase_Value)

function Hero20024_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20024_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20024_Value
