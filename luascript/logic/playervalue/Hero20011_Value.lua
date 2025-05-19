-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20011_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20011_Value = class("Hero20011_Value", AnimalBase_Value)

function Hero20011_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20011_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20011_Value
