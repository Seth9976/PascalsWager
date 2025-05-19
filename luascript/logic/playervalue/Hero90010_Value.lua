-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90010_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90010_Value = class("Hero90010_Value", AnimalBase_Value)

function Hero90010_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90010_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90010_Value
