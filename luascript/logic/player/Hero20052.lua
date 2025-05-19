-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20052.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20052_Define")

Hero20052 = class("Hero20052", AnimalBase)

function Hero20052:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20052:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end
end

function Hero20052:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20052:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)
end

function Hero20052:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20052:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20052:Exit()
	AnimalBase.Exit(self)
end

return Hero20052
