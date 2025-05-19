-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero90008.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero90008_Define")

Hero90008 = class("Hero90008", AnimalBase)

function Hero90008:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Other)
end

function Hero90008:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end
end

function Hero90008:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero90008:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero90008:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero90008:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero90008:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero90008:SetUI()
	AnimalBase.SetUI(self)
end

function Hero90008:Exit()
	AnimalBase.Exit(self)
end

return Hero90008
