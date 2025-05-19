-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status108.lua

require("LuaScript/Logic/Status/StatusBase")

Status108 = class("Status108", StatusBase)

function Status108:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status108
