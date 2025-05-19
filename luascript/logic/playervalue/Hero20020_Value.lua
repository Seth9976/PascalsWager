-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20020_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20020_Value = class("Hero20020_Value", AnimalBase_Value)

function Hero20020_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20020_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20020_Value
