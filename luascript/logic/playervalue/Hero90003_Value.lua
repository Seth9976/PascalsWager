-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90003_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90003_Value = class("Hero90003_Value", AnimalBase_Value)

function Hero90003_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90003_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90003_Value
