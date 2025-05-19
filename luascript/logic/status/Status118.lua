-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status118.lua

require("LuaScript/Logic/Status/StatusBase")

Status118 = class("Status118", StatusBase)

function Status118:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status118
