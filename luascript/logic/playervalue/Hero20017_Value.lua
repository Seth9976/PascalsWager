-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20017_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20017_Value = class("Hero20017_Value", AnimalBase_Value)

function Hero20017_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20017_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20017_Value
