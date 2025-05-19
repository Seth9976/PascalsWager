-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status107.lua

require("LuaScript/Logic/Status/StatusBase")

Status107 = class("Status107", StatusBase)

function Status107:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status107
