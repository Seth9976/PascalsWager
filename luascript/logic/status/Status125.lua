-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status125.lua

require("LuaScript/Logic/Status/StatusBase")

Status125 = class("Status125", StatusBase)

function Status125:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status125:Clear()
	if self.clearFlg == true then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.fromAnimalId > 0 and self.hitPlayer ~= nil then
		local overlay = self.hitPlayer:GetStatusOverlayByType(MS_StatusData.LogicType.DamageOverlay)
		local attackPlayer = self.sceneController:FindPlayerById(self.fromAnimalId)

		if overlay > 0 and attackPlayer ~= nil and attackPlayer:IsWillDead() == false and attackPlayer:IsShow() == true and self.sourceType == MS_StatusData.SourceType.Skill and self.sourceId > 0 then
			local tmpValue = self:GetCommonPropertyChange()

			self.hitPlayer:CalculateStatusDamage(self.statusData, tmpValue, overlay)

			local hitShake = 1

			hitShake = overlay < 3 and 1 or overlay < 6 and 2 or 3

			self.hitPlayer:HitStatus(self.statusData, AnimalBase_Define.HitType.Light, hitShake)
		end

		self.hitPlayer:ClearStatusByType(MS_StatusData.LogicType.DamageOverlay)
	end

	StatusBase.Clear(self)
end

return Status125
