-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero90009_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero90009_Value = class("Hero90009_Value", AnimalBase_Value)

function Hero90009_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero90009_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero90009_Value
