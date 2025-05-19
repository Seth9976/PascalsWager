-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90009.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90009_Define")

Hero90009 = class("Hero90009", AnimalBase)

function Hero90009:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Other)
end

function Hero90009:Start()
	AnimalBase.Start(self)
end

function Hero90009:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90009:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90009:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90009:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90009:Exit()
	AnimalBase.Exit(self)
end

return Hero90009
