-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20037_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20037_Value = class("Hero20037_Value", AnimalBase_Value)

function Hero20037_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20037_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20037_Value
