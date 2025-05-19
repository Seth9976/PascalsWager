-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status117.lua

require("LuaScript/Logic/Status/StatusBase")

Status117 = class("Status117", StatusBase)

function Status117:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status117
