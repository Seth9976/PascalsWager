-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20008_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20008_Value = class("Hero20008_Value", AnimalBase_Value)

function Hero20008_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20008_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20008_Value
