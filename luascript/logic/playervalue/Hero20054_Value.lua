-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20054_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20055_Value = class("Hero20055_Value", AnimalBase_Value)

function Hero20055_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20055_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20055_Value
