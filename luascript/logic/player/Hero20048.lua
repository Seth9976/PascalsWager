-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20048.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20048_Define")

Hero20048 = class("Hero20048", AnimalBase)

function Hero20048:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.heroVariety = 2
end

function Hero20048:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety > 1 then
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, true)
	else
		self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, 2, false)
	end
end

function Hero20048:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end
end

function Hero20048:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())

	local tfRoot1 = self:GetWeaponBox(1)

	self:CreateSelfEffectLoop("self_1", tfRoot1, "vfx_20048_self_1")
end

function Hero20048:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
	self:ClearSelfEffectLoop("self_1")
end

function Hero20048:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)
end

function Hero20048:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	if self.skillIndex == Hero20048_Define.SkillType.SkillNSP and self.skillCombo == 1 then
		if trigger == 1 then
			self.scene:OpenTrick(Hero20048_Define.TrickId)
		elseif trigger == 2 then
			self.scene:StopTrick(Hero20048_Define.TrickId)
		end
	end
end

function Hero20048:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20048:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20048_Define.SkillType.SkillNSP and self.skillCombo == 2 then
		self.scene:StopTrick(Hero20048_Define.TrickId)
	end
end

function Hero20048:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20048_Define.SkillType.SkillHP and self.skillCombo == 2 or self.skillIndex == Hero20048_Define.SkillType.SkillNSP and self.skillCombo == 1 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20048:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20048:Exit()
	AnimalBase.Exit(self)
end

return Hero20048
