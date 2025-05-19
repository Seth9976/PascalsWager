-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trap/Trap101.lua

require("LuaScript/Logic/Trap/TrapBase")

Trap101 = class("Trap101", TrapBase)

function Trap101:initialize(trapId, pos, fromVPlayer, fromTeamId)
	TrapBase.initialize(self, trapId, pos, fromVPlayer, fromTeamId)
end

function Trap101:AddTrapLogic(targetAnimal)
	return
end

function Trap101:Update()
	local ret = TrapBase.Update(self)

	return ret
end

return Trap101
