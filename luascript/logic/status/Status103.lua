-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status103.lua

require("LuaScript/Logic/Status/StatusBase")

Status103 = class("Status103", StatusBase)

function Status103:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status103:GetValueByPropertyId(logicType, propertyId)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and propertyId == self:GetStatusParam(1) and self:CheckTimeForPeriodValue() == true then
		return self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0
end

function Status103:GetPropertyValue(logicType)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and self:CheckTimeForPeriodValue() == true then
		return self:GetStatusParam(1), self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0, 0
end

return Status103
