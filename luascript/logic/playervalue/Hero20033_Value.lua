-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20033_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20033_Value = class("Hero20033_Value", AnimalBase_Value)

function Hero20033_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20033_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20033_Value
