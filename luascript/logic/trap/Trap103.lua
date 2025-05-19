-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trap/Trap103.lua

require("LuaScript/Logic/Trap/TrapBase")

Trap103 = class("Trap103", TrapBase)

function Trap103:initialize(trapId, pos, fromVPlayer, fromTeamId)
	TrapBase.initialize(self, trapId, pos, fromVPlayer, fromTeamId)
end

function Trap103:AddTrapLogic(targetAnimal)
	for id, data in pairs(self.trapPlayerList) do
		local animal = data[1]

		if animal:IsWillDead() == false and animal:IsShow() == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local brain = animal:GetBrain()

			if brain ~= nil then
				brain:SetAttracted(self.trapPosition)
			end
		end
	end
end

function Trap103:Update()
	local ret = TrapBase.Update(self)

	return ret
end

function Trap103:Exit()
	for id, data in pairs(self.trapPlayerList) do
		local animal = data[1]

		if animal:IsWillDead() == false and animal:IsShow() == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
			local brain = animal:GetBrain()

			if brain ~= nil then
				brain:SetAttracted(nil)
			end
		end
	end

	TrapBase.Exit(self)
end

return Trap103
