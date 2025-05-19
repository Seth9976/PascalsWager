-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status102.lua

require("LuaScript/Logic/Status/StatusBase")

Status102 = class("Status102", StatusBase)

function Status102:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status102:GetValueByPropertyId(logicType, propertyId)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and propertyId == self:GetStatusParam(1) then
		return self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0
end

function Status102:GetPropertyValue(logicType)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() then
		return self:GetStatusParam(1), self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0, 0
end

function Status102:Clear()
	if self.clearFlg == true then
		return
	end

	if self.hitPlayer ~= nil and self.statusId == 10121 and self.hitPlayer:IsHit() == false then
		self.hitPlayer:GetValue():ClearPropertyMaxDiff(MS_HeroData.Property.Weakness)
		self.hitPlayer:GetValue():SetPropertyToMax(MS_HeroData.Property.Weakness)
	end

	StatusBase.Clear(self)
end

return Status102
