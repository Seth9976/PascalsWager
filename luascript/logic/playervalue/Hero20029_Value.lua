-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20029_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20029_Value = class("Hero20029_Value", AnimalBase_Value)

function Hero20029_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20029_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20029_Value
