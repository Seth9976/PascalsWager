-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90005.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90005_Define")

Hero90005 = class("Hero90005", AnimalBase)

function Hero90005:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero90005:Start()
	AnimalBase.Start(self)
end

function Hero90005:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90005:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90005:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90005:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_20027 then
		self.deadHide = false
	end
end

function Hero90005:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90005:Exit()
	AnimalBase.Exit(self)
end

return Hero90005
