-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20002_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20002_Value = class("Hero20002_Value", AnimalBase_Value)

function Hero20002_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20002_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20002_Value
