-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20049_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20049_Value = class("Hero20049_Value", AnimalBase_Value)

function Hero20049_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20049_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20049_Value
