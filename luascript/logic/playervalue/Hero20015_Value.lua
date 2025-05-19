-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20015_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20015_Value = class("Hero20015_Value", AnimalBase_Value)

function Hero20015_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20015_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20015_Value
