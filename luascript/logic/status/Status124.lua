-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status124.lua

require("LuaScript/Logic/Status/StatusBase")

Status124 = class("Status124", StatusBase)

function Status124:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status124:GetValueByPropertyId(logicType, propertyId)
	if self:IsActive() == true and logicType == MS_StatusData.LogicType.PropertyMaxSub and propertyId == self:GetStatusParam(1) then
		return self:GetCommonPropertyChange() * self.overlay
	end

	return 0
end

function Status124:GetPropertyValue(logicType)
	if self:IsActive() == true and logicType == MS_StatusData.LogicType.PropertyMaxSub then
		return self:GetStatusParam(1), self:GetCommonPropertyChange() * self.overlay
	end

	return 0, 0
end

return Status124
