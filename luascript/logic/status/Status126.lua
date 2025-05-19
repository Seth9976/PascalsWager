-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status126.lua

require("LuaScript/Logic/Status/StatusBase")

Status126 = class("Status126", StatusBase)

function Status126:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status126
