-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20030.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20030_Define")

Hero20030 = class("Hero20030", AnimalBase)

function Hero20030:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20030:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20030_Define.EquipmentSandClock, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20030_Define.EquipmentSandClock, false)
	end
end

function Hero20030:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20030:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20030:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20030:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20030:Exit()
	AnimalBase.Exit(self)
end

return Hero20030
