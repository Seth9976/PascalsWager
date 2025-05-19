-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20007_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20007_Value = class("Hero20007_Value", AnimalBase_Value)
Hero20007_Value.static.GradeUpHpRate = 0.5

function Hero20007_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20007_Value:Update()
	AnimalBase_Value.Update(self)
end

function Hero20007_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20007_Value
