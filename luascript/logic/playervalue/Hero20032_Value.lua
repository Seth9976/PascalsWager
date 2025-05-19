-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20032_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20032_Value = class("Hero20032_Value", AnimalBase_Value)

function Hero20032_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20032_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20032_Value
