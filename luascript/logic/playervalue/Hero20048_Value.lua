-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20048_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20048_Value = class("Hero20048_Value", AnimalBase_Value)

function Hero20048_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20048_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20048_Value
