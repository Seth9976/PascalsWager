-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/OccupyZone.lua

OccupyZone = class("OccupyZone")
OccupyZone.static.Status = {
	Ready = 2,
	Keep = 3,
	Close = 0,
	Open = 1
}
OccupyZone.static.TeamColor = {
	Blue = 2,
	Red = 1
}
OccupyZone.static.OpenFrameZoneC = 180
OccupyZone.static.OpenFrameZoneCTips = 10
OccupyZone.static.ReadyFrameZoneB = 8
OccupyZone.static.ReadyFrameZoneC = 8

function OccupyZone:initialize(occupy_controller, type, id)
	self.occupyController = occupy_controller
	self.zoneType = type
	self.zoneId = id
	self.status = OccupyZone.Status.Close
	self.teamIdForReady = 0
	self.teamId = 0
	self.readyFrameMax = 0
	self.frame = 0

	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
		self.readyFrameMax = ControllerMain.ConvertSecondToFrame(OccupyZone.ReadyFrameZoneB)
		self.effectOccupy = nil
		self.effectStick1 = nil
		self.effectStick2 = nil
	elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		self.readyFrameMax = ControllerMain.ConvertSecondToFrame(OccupyZone.ReadyFrameZoneC)
		self.effectOccupy = nil
	end

	self.team1List = nil
	self.team2List = nil
	self.teamNumList = {}
	self.hostPlayer = nil
	self.teamHostId = 0
	self.teamEnemyId = 0
end

function OccupyZone:StartZone()
	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
		self:OpenZone()
		self.occupyController:AddZoneUI(self.zoneType, self.zoneId)
	elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		self:CloseZone()
		self.occupyController:AddZoneUI(self.zoneType, self.zoneId)
	end
end

function OccupyZone:SetScene(scene)
	self.scene = scene
end

function OccupyZone:SetHostPlayer(player)
	self.hostPlayer = player
	self.teamHostId = self.hostPlayer:GetTeamId()
	self.teamEnemyId = 3 - self.teamHostId
end

function OccupyZone:SetTeam(index, teamList)
	if index == 1 then
		self.team1List = teamList
		self.teamNumList[1] = 0
	elseif index == 2 then
		self.team2List = teamList
		self.teamNumList[2] = 0
	end
end

function OccupyZone:ClearZoneEffect()
	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
		if self.effectOccupy ~= nil then
			self.effectOccupy:Clear()

			self.effectOccupy = nil
		end

		if self.effectStick1 ~= nil then
			self.effectStick1:Clear()

			self.effectStick1 = nil
		end

		if self.effectStick2 ~= nil then
			self.effectStick2:Clear()

			self.effectStick2 = nil
		end
	elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneC and self.effectOccupy ~= nil then
		self.effectOccupy:Clear()

		self.effectOccupy = nil
	end
end

function OccupyZone:PlayZoneBEffect(id)
	local effRootName = "effect_bzone_" .. self.zoneId
	local tfEffZone = self.scene:GetEffectRoot(effRootName)

	if id > 0 then
		local effRootStickName1 = effRootName .. "_stick_1"
		local effRootStickName2 = effRootName .. "_stick_2"
		local tfEffStick1 = self.scene:GetEffectRoot(effRootStickName1)
		local tfEffStick2 = self.scene:GetEffectRoot(effRootStickName2)

		if self.effectOccupy == nil then
			if self.zoneId == 1 or self.zoneId == 3 then
				if id == self.teamHostId then
					VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_blue_zl1")

					self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Bblue1")
				else
					VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_red_zl1")

					self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Bred1")
				end
			elseif id == self.teamHostId then
				VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_blue_zl2")

				self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Bblue2")
			else
				VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_red_zl2")

				self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Bred2")
			end
		end

		if self.effectStick1 == nil and self.effectStick2 == nil then
			if id == self.teamHostId then
				self.effectStick1 = VfxManager.PlayTransformFreezeMulti(tfEffStick1, "vfx_Arena10001_blue")
				self.effectStick2 = VfxManager.PlayTransformFreezeMulti(tfEffStick2, "vfx_Arena10001_blue")
			else
				self.effectStick1 = VfxManager.PlayTransformFreezeMulti(tfEffStick1, "vfx_Arena10001_red")
				self.effectStick2 = VfxManager.PlayTransformFreezeMulti(tfEffStick2, "vfx_Arena10001_red")
			end
		end
	elseif self.effectOccupy == nil then
		if self.zoneId == 1 or self.zoneId == 3 then
			self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Byellow1")
		else
			self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_Byellow2")
		end
	end
end

function OccupyZone:PlayZoneCEffect(id)
	local effRootName = "effect_czone_ball"
	local tfEffZone = self.scene:GetEffectRoot(effRootName)

	self.effectOccupy = VfxManager.PlayTransformFreezeMulti(tfEffZone, "vfx_Arena10001_activate")
end

function OccupyZone:OpenZone()
	self.status = OccupyZone.Status.Open
	self.teamIdForReady = 0
	self.teamId = 0
	self.frame = 0

	self:ClearZoneEffect()

	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
		self:PlayZoneBEffect(self.teamId)
	elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		self:PlayZoneCEffect(self.teamId)
		self.occupyController:ShowZoneCCountDown(false)
		self.occupyController:ShowZoneCRestTime(false)
	end
end

function OccupyZone:ReturnOpenZone()
	self.status = OccupyZone.Status.Open
	self.teamIdForReady = 0
	self.frame = 0
end

function OccupyZone:CloseZone()
	self.status = OccupyZone.Status.Close
	self.teamIdForReady = 0
	self.teamId = 0
	self.frame = 0

	self:ClearZoneEffect()

	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		self.occupyController:ShowZoneCRestTime(true)
	end
end

function OccupyZone:StartReady(id)
	self.status = OccupyZone.Status.Ready
	self.frame = 0
	self.teamIdForReady = id
end

function OccupyZone:KeepZone(id)
	self.status = OccupyZone.Status.Keep
	self.teamIdForReady = 0
	self.teamId = id
	self.frame = 0

	self:ClearZoneEffect()

	if self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
		self:PlayZoneBEffect(self.teamId)
	elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		-- block empty
	end

	self.occupyController:OccupyZone(self.zoneType, self.zoneId, self.teamId)
end

function OccupyZone:ReturnKeepZone()
	self.status = OccupyZone.Status.Keep
	self.teamIdForReady = 0
	self.frame = 0
end

function OccupyZone:GetTeamId()
	return self.teamId
end

function OccupyZone:GetTeamIdForReady()
	return self.teamIdForReady
end

function OccupyZone:GetStatus()
	return self.status
end

function OccupyZone:GetType()
	return self.zoneType
end

function OccupyZone:GetZoneId()
	return self.zoneId
end

function OccupyZone:GetReadyStatus()
	if self.status == OccupyZone.Status.Ready then
		return true, self.teamIdForReady, self.frame, self.readyFrameMax
	end

	return false, 0, 0, self.readyFrameMax
end

function OccupyZone:GetOpenRestTime()
	if self.status == OccupyZone.Status.Close and self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
		local allFrame = ControllerMain.ConvertSecondToFrame(OccupyZone.OpenFrameZoneC)

		if allFrame >= self.frame then
			local tmpDiffFrame = allFrame - self.frame
			local tmpSec = ControllerMain.ConvertFrameToSec(tmpDiffFrame)

			return true, tmpSec
		end
	end

	return false, 0
end

function OccupyZone:CheckTeam()
	self.teamNumList[1] = 0

	for i, player in pairs(self.team1List) do
		if player:IsDead() == false and player:IsShow() == true then
			local tmpGroundType, tmpZoneType, tmpZoneId = player:GetTouchGroundDataSimple()

			if tmpZoneType == self.zoneType and tmpZoneId == self.zoneId then
				self.teamNumList[1] = self.teamNumList[1] + 1
			end
		end
	end

	self.teamNumList[2] = 0

	for i, player in pairs(self.team2List) do
		if player:IsDead() == false and player:IsShow() == true then
			local tmpGroundType, tmpZoneType, tmpZoneId = player:GetTouchGroundDataSimple()

			if tmpZoneType == self.zoneType and tmpZoneId == self.zoneId then
				self.teamNumList[2] = self.teamNumList[2] + 1
			end
		end
	end

	if self.teamNumList[1] > 0 and self.teamNumList[2] <= 0 then
		return 1
	elseif self.teamNumList[1] <= 0 and self.teamNumList[2] > 0 then
		return 2
	else
		return 0
	end
end

function OccupyZone:ShowZoneUI(showWarning)
	local tmpRate = 0
	local tmpShow = false

	if self.status == OccupyZone.Status.Open then
		tmpRate = 0
		tmpShow = true
	elseif self.status == OccupyZone.Status.Ready then
		tmpRate = self.frame / self.readyFrameMax
		tmpRate = Mathf.Clamp(tmpRate, 0, 1)
		tmpShow = true
	elseif self.status == OccupyZone.Status.Keep then
		tmpRate = 1
		tmpShow = true
	end

	self.occupyController:UpdateZoneUI(self.zoneType, self.zoneId, self.teamId, self.teamIdForReady, tmpRate, tmpShow)
	self.occupyController:ShowZoneWarning(self.zoneType, self.zoneId, showWarning)
end

function OccupyZone:UpdateZone()
	local showWarning = false

	if self.status == OccupyZone.Status.Close then
		if self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
			self.frame = self.frame + 1

			local allFrame = ControllerMain.ConvertSecondToFrame(OccupyZone.OpenFrameZoneC)

			if allFrame < self.frame then
				self:OpenZone()
			else
				local tmpDiffFrame = allFrame - self.frame
				local tmpSec = ControllerMain.ConvertFrameToSec(tmpDiffFrame)

				self.occupyController:SetZoneCRestTime(Mathf.Floor(tmpSec))

				local allFrameTips = allFrame - ControllerMain.ConvertSecondToFrame(OccupyZone.OpenFrameZoneCTips)

				if allFrameTips <= self.frame then
					if self.frame == allFrameTips then
						self.occupyController:ShowZoneCCountDown(true)
					end

					self.occupyController:SetZoneCCountDown(Mathf.Floor(tmpSec))
				end
			end
		end
	elseif self.status == OccupyZone.Status.Open then
		local tmpTeamId = self:CheckTeam()

		if tmpTeamId > 0 then
			self:StartReady(tmpTeamId)
		elseif self.teamNumList[self.teamHostId] > 0 or self.teamNumList[self.teamEnemyId] > 0 then
			showWarning = true
		end
	elseif self.status == OccupyZone.Status.Ready then
		local tmpTeamId = self:CheckTeam()

		if tmpTeamId > 0 and self.teamIdForReady > 0 then
			if self.teamIdForReady == tmpTeamId then
				self.frame = self.frame + 1

				if self.frame > self.readyFrameMax then
					self:KeepZone(tmpTeamId)
				end
			elseif self.teamId > 0 then
				self:ReturnKeepZone()
			else
				self:StartReady(tmpTeamId)
			end
		elseif self.teamId > 0 then
			self:ReturnKeepZone()
		else
			self:ReturnOpenZone()
		end

		showWarning = true
	elseif self.status == OccupyZone.Status.Keep then
		if self.zoneType == ControllerOccupyMode.ZoneType.ZoneC then
			self:CloseZone()
		elseif self.zoneType == ControllerOccupyMode.ZoneType.ZoneB then
			if self.teamId > 0 then
				local tmpTeamId = self:CheckTeam()

				if tmpTeamId > 0 and tmpTeamId ~= self.teamId then
					self:StartReady(tmpTeamId)
				elseif self.teamId == self.teamHostId and self.teamNumList[self.teamEnemyId] > 0 then
					showWarning = true
				elseif self.teamId == self.teamEnemyId and self.teamNumList[self.teamHostId] > 0 then
					showWarning = true
				end
			else
				self:OpenZone()
			end
		end
	end

	self:ShowZoneUI(showWarning)
end

function OccupyZone:Exit()
	self:ClearZoneEffect()
end
