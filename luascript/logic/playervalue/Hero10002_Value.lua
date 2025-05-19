-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero10002_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero10002_Value = class("Hero10002_Value", AnimalBase_Value)

function Hero10002_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero10002_Value:LoadSaveProperty()
	AnimalBase_Value.LoadSaveProperty(self)
	self.animal:LoadSaveBullet()
end

function Hero10002_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero10002_Value
