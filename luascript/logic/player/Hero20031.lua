-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20031.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20031_Define")

Hero20031 = class("Hero20031", AnimalBase)

function Hero20031:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.SkillLPEffect = nil
end

function Hero20031:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 and self.characterConfig ~= nil then
		local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

		if mat ~= nil then
			self:ChangeMaterial(mat)
		end
	end
end

function Hero20031:Show()
	AnimalBase.Show(self)
end

function Hero20031:Hide()
	AnimalBase.Hide(self)
end

function Hero20031:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20031:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true then
		local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

		if self.skillIndex == Hero20031_Define.SkillType.SkillLP and self.skillCombo == 1 then
			local hitPlayer = hitData:GetHitPlayer()

			if hitPlayer ~= nil then
				local tmpVfxRoot = self:GetEffectRoot(skillData.HitEffectRoot)

				self.SkillLPEffect = VfxManager.PlayTransformFreezeMulti(hitPlayer:GetBodyChest(), skillData[AnimalBase_Define.VfxSkillKey1])

				if self.SkillLPEffect ~= nil then
					self.SkillLPEffect:AddMultipleBind(1, self:GetWeaponBox(1))
					self.SkillLPEffect:AddMultipleBind(2, hitPlayer:GetBodyChest())
					self.SkillLPEffect:SetDelayClear(true, nil)
				end
			end
		end
	end
end

function Hero20031:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20031:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20031:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20031:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20031:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20031_Define.SkillType.SkillLP and self.skillCombo == 1 then
		if self.SkillLPEffect ~= nil then
			self.SkillLPEffect:ClearMultipleBind()
			self.SkillLPEffect:Clear()
		end

		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20031:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20031:Exit()
	AnimalBase.Exit(self)
end

return Hero20031
