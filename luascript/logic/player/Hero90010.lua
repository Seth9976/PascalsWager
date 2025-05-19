-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90010.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90010_Define")

Hero90010 = class("Hero90010", AnimalBase)

function Hero90010:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero90010:Start()
	AnimalBase.Start(self)
	self:SetMoveThroughAll(true)

	if self.heroVariety > 1 then
		self:Hide()
	end
end

function Hero90010:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90010:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90010:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90010:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90010:Exit()
	AnimalBase.Exit(self)
end

return Hero90010
