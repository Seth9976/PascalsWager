-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10001_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10001_Value = class("Hero10001_Value", AnimalBase_Value)

function Hero10001_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10001_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10001_Value
