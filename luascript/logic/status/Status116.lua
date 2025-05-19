-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status116.lua

require("LuaScript/Logic/Status/StatusBase")

Status116 = class("Status116", StatusBase)

function Status116:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status116
