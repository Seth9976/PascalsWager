-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status104.lua

require("LuaScript/Logic/Status/StatusBase")

Status104 = class("Status104", StatusBase)

function Status104:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status104:GetValueByPropertyId(logicType, propertyId)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and propertyId == self:GetStatusParam(1) and self:CheckTimeForPeriodValue() == true then
		local ret = self:GetCommonPropertyChange() * self:GetOverlaymultiplier()

		if propertyId == MS_HeroData.Property.Hp then
			if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and self.hitPlayer ~= nil and self.hitPlayer:IsHost() == true then
				ret = ret * AnimalBase_Value.GetCasualDamageRatio()
			end

			if BattleData.isHaveNoobItem() == true and self.hitPlayer ~= nil and self.hitPlayer:IsHost() == true then
				ret = ret * AnimalBase_Value_Define.NoobItemDamageRatio
			end
		end

		if (propertyId == MS_HeroData.Property.Hp or propertyId == MS_HeroData.Property.San) and self.hitPlayer ~= nil and (self.hitPlayer:IsMuteki(nil) == true or self.hitPlayer:IsNoDamage() == true) then
			ret = 0
		end

		return ret
	end

	return 0
end

function Status104:GetPropertyValue(logicType)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and self:CheckTimeForPeriodValue() == true then
		local propertyId = self:GetStatusParam(1)
		local ret = self:GetCommonPropertyChange() * self:GetOverlaymultiplier()

		if propertyId == MS_HeroData.Property.Hp then
			if BattleData.GetDifficulty() == BattleData.GlobalDifficultyLevel.Casual and self.hitPlayer ~= nil and self.hitPlayer:IsHost() == true then
				ret = ret * AnimalBase_Value.GetCasualDamageRatio()
			end

			if BattleData.isHaveNoobItem() == true and self.hitPlayer ~= nil and self.hitPlayer:IsHost() == true then
				ret = ret * AnimalBase_Value_Define.NoobItemDamageRatio
			end
		end

		return propertyId, ret
	end

	return 0, 0
end

return Status104
