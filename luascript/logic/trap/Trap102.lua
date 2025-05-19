-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trap/Trap102.lua

require("LuaScript/Logic/Trap/TrapBase")

Trap102 = class("Trap102", TrapBase)

function Trap102:initialize(trapId, pos, fromVPlayer, fromTeamId)
	TrapBase.initialize(self, trapId, pos, fromVPlayer, fromTeamId)
end

function Trap102:AddTrapLogic(targetAnimal)
	if targetAnimal ~= nil then
		targetAnimal:AddLogicRule(AnimalBase_Define.LogicRule.WalkOnly, 0)
		targetAnimal:AddLogicRule(AnimalBase_Define.LogicRule.DodgeClose, self.trapData.Param1)
	end
end

function Trap102:Update()
	local ret = TrapBase.Update(self)

	return ret
end

return Trap102
