-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20050_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20050_Value = class("Hero20050_Value", AnimalBase_Value)

function Hero20050_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20050_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20050_Value
