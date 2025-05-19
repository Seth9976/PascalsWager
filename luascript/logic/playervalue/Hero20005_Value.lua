-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20005_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20005_Value = class("Hero20005_Value", AnimalBase_Value)

function Hero20005_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20005_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20005_Value
