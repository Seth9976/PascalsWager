-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90004.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90004_Define")

Hero90004 = class("Hero90004", AnimalBase)

function Hero90004:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero90004:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)
end

function Hero90004:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 2 then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.heroVariety - 1, 0, 0)
	end
end

function Hero90004:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90004:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90004:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90004:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_20027 then
		self.deadHide = false
	end
end

function Hero90004:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90004:Exit()
	AnimalBase.Exit(self)
end

return Hero90004
