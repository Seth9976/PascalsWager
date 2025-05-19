-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20006_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20006_Value = class("Hero20006_Value", AnimalBase_Value)

function Hero20006_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20006_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20006_Value
