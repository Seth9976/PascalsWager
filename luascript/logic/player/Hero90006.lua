-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90006.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90006_Define")

Hero90006 = class("Hero90006", AnimalBase)

function Hero90006:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero90006:Start()
	AnimalBase.Start(self)
end

function Hero90006:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90006:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90006:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90006:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_20027 then
		self.deadHide = false
	end
end

function Hero90006:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90006:Exit()
	AnimalBase.Exit(self)
end

return Hero90006
