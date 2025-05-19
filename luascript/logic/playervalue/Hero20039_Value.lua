-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20039_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20039_Value = class("Hero20039_Value", AnimalBase_Value)

function Hero20039_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20039_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20039_Value
