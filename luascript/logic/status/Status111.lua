-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status111.lua

require("LuaScript/Logic/Status/StatusBase")

Status111 = class("Status111", StatusBase)

function Status111:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status111
