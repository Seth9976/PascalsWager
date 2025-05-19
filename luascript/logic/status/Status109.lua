-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status109.lua

require("LuaScript/Logic/Status/StatusBase")

Status109 = class("Status109", StatusBase)

function Status109:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)

	if self.hitPlayer ~= nil then
		local propertyId = self:GetStatusParam(1)
		local value = self:GetCommonPropertyChange()

		if propertyId > 0 and value > 0 then
			self.hitPlayer:GetValue():SetPropertyToZero(propertyId)
			self.hitPlayer:GetValue():AddProperty(propertyId, value)
		end
	end
end

function Status109:Update()
	local ret = StatusBase.Update(self)

	if ret == true and self.hitPlayer ~= nil then
		local propertyId = self:GetStatusParam(1)

		if propertyId > 0 then
			local value = self.hitPlayer:GetValue():GetProperty(propertyId)

			if value <= 0 then
				return false
			end
		end
	end

	return ret
end

function Status109:Clear()
	if self.clearFlg == true then
		return
	end

	if self.hitPlayer ~= nil then
		local propertyId = self:GetStatusParam(1)

		if propertyId > 0 then
			self.hitPlayer:GetValue():SetPropertyToZero(propertyId)
		end
	end

	StatusBase.Clear(self)
end

return Status109
