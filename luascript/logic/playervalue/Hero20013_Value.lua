-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20013_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20013_Value = class("Hero20013_Value", AnimalBase_Value)

function Hero20013_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20013_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20013_Value
