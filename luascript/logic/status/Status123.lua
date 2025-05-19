-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status123.lua

require("LuaScript/Logic/Status/StatusBase")

Status123 = class("Status123", StatusBase)

function Status123:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status123
