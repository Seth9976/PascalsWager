-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90002_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90002_Value = class("Hero90002_Value", AnimalBase_Value)

function Hero90002_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90002_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90002_Value
