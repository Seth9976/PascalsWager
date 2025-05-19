-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20047.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20047_Define")

Hero20047 = class("Hero20047", AnimalBase)

function Hero20047:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.waterMaterial = nil
	self.bodyMaterial = nil
	self.waterColor = Color.black
	self.waterColor.r = Hero20047_Define.WaterColorOld.r
	self.waterColor.g = Hero20047_Define.WaterColorOld.g
	self.waterColor.b = Hero20047_Define.WaterColorOld.b
	self.waterColor.a = Hero20047_Define.WaterColorOld.a
end

function Hero20047:Start()
	AnimalBase.Start(self)
	self:SetMoveMuteki(true)
	self:SetLockDisable(true)

	local water = self.scene:GetVisibleObject("water_group/Arena10010_CellWater_01Pro_Red")

	if water ~= nil then
		local waterRender = water:GetComponent(typeof("UnityEngine.MeshRenderer"))

		if waterRender ~= nil then
			self.waterMaterial = waterRender.sharedMaterial

			self.waterMaterial:SetColor("_Color", self.waterColor)
		end
	end

	if self.tfBodyRender ~= nil then
		self.bodyMaterial = self.tfBodyRender.material
	end
end

function Hero20047:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self.skillIndex == Hero20047_Define.SkillType.SkillLP then
		if self.skillCombo == 1 then
			if self.waterMaterial ~= nil then
				self.waterColor.r = Mathf.Lerp(Hero20047_Define.WaterColorOld.r, Hero20047_Define.WaterColorNew.r, self.animatorTime)
				self.waterColor.g = Mathf.Lerp(Hero20047_Define.WaterColorOld.g, Hero20047_Define.WaterColorNew.g, self.animatorTime)
				self.waterColor.b = Mathf.Lerp(Hero20047_Define.WaterColorOld.b, Hero20047_Define.WaterColorNew.b, self.animatorTime)
				self.waterColor.a = Mathf.Lerp(Hero20047_Define.WaterColorOld.a, Hero20047_Define.WaterColorNew.a, self.animatorTime)

				self.waterMaterial:SetColor("_Color", self.waterColor)
			end

			if self.bodyMaterial ~= nil then
				local rimIntensity = Mathf.Lerp(Hero20047_Define.RimIntensityOld, Hero20047_Define.RimIntensityNew, self.animatorTime)

				self.bodyMaterial:SetFloat("_RimIntensity", rimIntensity)
			end
		elseif self.skillCombo == 3 then
			if self.waterMaterial ~= nil then
				self.waterColor.r = Mathf.Lerp(Hero20047_Define.WaterColorNew.r, Hero20047_Define.WaterColorOld.r, self.animatorTime)
				self.waterColor.g = Mathf.Lerp(Hero20047_Define.WaterColorNew.g, Hero20047_Define.WaterColorOld.g, self.animatorTime)
				self.waterColor.b = Mathf.Lerp(Hero20047_Define.WaterColorNew.b, Hero20047_Define.WaterColorOld.b, self.animatorTime)
				self.waterColor.a = Mathf.Lerp(Hero20047_Define.WaterColorNew.a, Hero20047_Define.WaterColorOld.a, self.animatorTime)

				self.waterMaterial:SetColor("_Color", self.waterColor)
			end

			if self.bodyMaterial ~= nil then
				local rimIntensity = Mathf.Lerp(Hero20047_Define.RimIntensityNew, Hero20047_Define.RimIntensityOld, self.animatorTime)

				self.bodyMaterial:SetFloat("_RimIntensity", rimIntensity)
			end
		end
	end
end

function Hero20047:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20047:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20047:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20047_Define.SkillType.SkillLP and self.skillCombo == 2 then
		if self.waterMaterial ~= nil then
			self.waterMaterial:SetColor("_Color", Hero20047_Define.WaterColorNew)
		end

		if self.bodyMaterial ~= nil then
			self.bodyMaterial:SetFloat("_RimIntensity", Hero20047_Define.RimIntensityNew)
		end
	end
end

function Hero20047:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20047_Define.SkillType.SkillLP and self.skillIndex ~= skillIndexNext then
		if self.waterMaterial ~= nil then
			self.waterMaterial:SetColor("_Color", Hero20047_Define.WaterColorOld)
		end

		if self.bodyMaterial ~= nil then
			self.bodyMaterial:SetFloat("_RimIntensity", Hero20047_Define.RimIntensityOld)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20047:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20047:Exit()
	if self.waterMaterial ~= nil then
		self.waterMaterial:SetColor("_Color", self.waterColor)
	end

	self.waterMaterial = nil

	if self.bodyMaterial ~= nil then
		GoDestroy(self.bodyMaterial)
	end

	self.bodyMaterial = nil
	self.waterColor = nil

	AnimalBase.Exit(self)
end

return Hero20047
