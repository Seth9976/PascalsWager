-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90011_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90011_Value = class("Hero90011_Value", AnimalBase_Value)

function Hero90011_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90011_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90011_Value
