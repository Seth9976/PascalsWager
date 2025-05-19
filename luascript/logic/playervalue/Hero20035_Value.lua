-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20035_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20035_Value = class("Hero20035_Value", AnimalBase_Value)

function Hero20035_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20035_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20035_Value
