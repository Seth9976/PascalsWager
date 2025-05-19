-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90001_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90001_Value = class("Hero90001_Value", AnimalBase_Value)

function Hero90001_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90001_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90001_Value
