-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status105.lua

require("LuaScript/Logic/Status/StatusBase")

Status105 = class("Status105", StatusBase)

function Status105:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status105:Update()
	local ret = StatusBase.Update(self)

	if ret == true and self:IsActive() == true and self.hitPlayer:IsDead() == false and self.hitPlayer:IsShow() == true and (self.hitPlayer:IsHit() == false or self.hitPlayer:IsHitByType(AnimalBase_Define.HitType.Freeze) == true) then
		self.hitPlayer:ChangeHitPeriod(AnimalBase_Define.HitType.Freeze, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
	end

	return ret
end

return Status105
