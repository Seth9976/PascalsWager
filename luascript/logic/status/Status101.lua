-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status101.lua

require("LuaScript/Logic/Status/StatusBase")

Status101 = class("Status101", StatusBase)

function Status101:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status101:GetValueByPropertyId(logicType, propertyId)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() and propertyId == self:GetStatusParam(1) then
		return self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0
end

function Status101:GetPropertyValue(logicType)
	if self:IsActive() == true and logicType == self:GetStatusLogicType() then
		return self:GetStatusParam(1), self:GetCommonPropertyChange() * self:GetOverlaymultiplier()
	end

	return 0, 0
end

return Status101
