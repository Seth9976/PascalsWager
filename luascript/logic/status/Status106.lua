-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status106.lua

require("LuaScript/Logic/Status/StatusBase")

Status106 = class("Status106", StatusBase)

function Status106:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status106
