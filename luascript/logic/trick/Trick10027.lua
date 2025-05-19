-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/Trick10027.lua

require("LuaScript/Logic/Trick/Trick")

Trick10027 = class("Trick10027", Trick)

function Trick10027:initialize(scene, trickId, trickTf)
	Trick.initialize(self, scene, trickId, trickTf)

	if self.effectConfig ~= nil then
		self.effectConfig[1][Trick.EffectConfig.DelayClear] = true
		self.effectConfig[2][Trick.EffectConfig.DefaultPlay] = false
	end
end

function Trick10027:Exit()
	Trick.Exit(self)
end

return Trick10027
