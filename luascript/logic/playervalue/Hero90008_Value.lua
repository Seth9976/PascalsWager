-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90008_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90008_Value = class("Hero90008_Value", AnimalBase_Value)

function Hero90008_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90008_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90008_Value
