-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20046_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20046_Value = class("Hero20046_Value", AnimalBase_Value)

function Hero20046_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20046_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20046_Value
