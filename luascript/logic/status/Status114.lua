-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status114.lua

require("LuaScript/Logic/Status/StatusBase")

Status114 = class("Status114", StatusBase)

function Status114:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status114
