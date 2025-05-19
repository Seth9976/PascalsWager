-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20038_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20038_Value = class("Hero20038_Value", AnimalBase_Value)

function Hero20038_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20038_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20038_Value
