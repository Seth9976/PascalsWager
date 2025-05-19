-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20047_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20047_Value = class("Hero20047_Value", AnimalBase_Value)

function Hero20047_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20047_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20047_Value
