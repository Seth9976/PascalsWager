-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status112.lua

require("LuaScript/Logic/Status/StatusBase")

Status112 = class("Status112", StatusBase)

function Status112:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status112
