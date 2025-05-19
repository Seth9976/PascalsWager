-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status120.lua

require("LuaScript/Logic/Status/StatusBase")

Status120 = class("Status120", StatusBase)

function Status120:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
end

function Status120:Clear()
	if self.clearFlg == true then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.statusActiveTime + self.statusLifeTime then
			FS_UserData.story:ClearHeroCall()
		end
	end

	StatusBase.Clear(self)
end

return Status120
