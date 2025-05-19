-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90007_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90007_Value = class("Hero90007_Value", AnimalBase_Value)

function Hero90007_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90007_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90007_Value
