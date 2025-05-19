-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status115.lua

require("LuaScript/Logic/Status/StatusBase")

Status115 = class("Status115", StatusBase)

function Status115:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status115
