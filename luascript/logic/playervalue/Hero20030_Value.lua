-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20030_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20030_Value = class("Hero20030_Value", AnimalBase_Value)

function Hero20030_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20030_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20030_Value
