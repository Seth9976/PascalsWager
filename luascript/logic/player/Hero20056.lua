-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20056.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20056_Define")

Hero20056 = class("Hero20056", AnimalBase)

function Hero20056:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20056:Start()
	AnimalBase.Start(self)
end

function Hero20056:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20056:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)
end

function Hero20056:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20056:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20056:Exit()
	AnimalBase.Exit(self)
end

return Hero20056
