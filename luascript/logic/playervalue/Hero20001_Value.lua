-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20001_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20001_Value = class("Hero20001_Value", AnimalBase_Value)

function Hero20001_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20001_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20001_Value
