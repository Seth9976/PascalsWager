-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20003_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20003_Value = class("Hero20003_Value", AnimalBase_Value)

function Hero20003_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20003_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20003_Value
