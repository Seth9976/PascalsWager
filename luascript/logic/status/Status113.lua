-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status113.lua

require("LuaScript/Logic/Status/StatusBase")

Status113 = class("Status113", StatusBase)

function Status113:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

return Status113
