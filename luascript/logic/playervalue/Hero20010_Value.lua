-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20010_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20010_Value = class("Hero20010_Value", AnimalBase_Value)

function Hero20010_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20010_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20010_Value
