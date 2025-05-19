-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10006_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10006_Value = class("Hero10006_Value", AnimalBase_Value)

function Hero10006_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10006_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10006_Value
