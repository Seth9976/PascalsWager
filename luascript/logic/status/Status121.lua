-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status121.lua

require("LuaScript/Logic/Status/StatusBase")

Status121 = class("Status121", StatusBase)

function Status121:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status121
