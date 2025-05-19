-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerOccupyMode.lua

require("LuaScript/Controller/ControllerModeBase")
require("LuaScript/StructData/FS_BattleData_OccupyMode")
require("LuaScript/StructData/FS_Battle_MatchGame")
require("LuaScript/Logic/Battle/OccupyZone")

ControllerOccupyMode = class("ControllerOccupyMode", ControllerModeBase)
ControllerOccupyMode.static.PlayerBornFrame = 300
ControllerOccupyMode.static.ScoreMax = 5
ControllerOccupyMode.static.OccupyStartTime = 6
ControllerOccupyMode.static.OccupyTimeMax = 600
ControllerOccupyMode.static.ZoneBMax = 4
ControllerOccupyMode.static.ZoneType = {
	ZoneC = 3,
	ZoneB = 2,
	ZoneA = 1
}
ControllerOccupyMode.static.Status = {
	Result = 3,
	Start = 1,
	Normal = 2
}
ControllerOccupyMode.static.VfxList = {
	{
		vfx_Arena10001 = "vfx_Arena10001_blue"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_red"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_redline"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_blueline"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_redball"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_blueball"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_redeye"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_blueeye"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_redhit"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_bluehit"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_activate"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Bred1"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Bred2"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Bblue1"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Bblue2"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Byellow1"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_Byellow2"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_blue_zl1"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_blue_zl2"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_red_zl1"
	},
	{
		vfx_Arena10001 = "vfx_Arena10001_red_zl2"
	}
}
ControllerOccupyMode.static.FlagShowList = {
	{
		false,
		true,
		true,
		false
	},
	{
		true,
		false,
		false,
		true
	}
}

function ControllerOccupyMode:initialize()
	ControllerModeBase.initialize(self)

	self.gameFrame = 0

	self:InitZone()
	self:InitPlayer()
	self:InitUI()
	self.sceneController:EnterNormal()
end

function ControllerOccupyMode:InitZone()
	local team1 = self.sceneController:GetTeamList(1)
	local team2 = self.sceneController:GetTeamList(2)

	self.hostPlayerTeamId = self.hostPlayer:GetTeamId()
	self.zoneBList = {}
	self.effZoneBEyeList = {}

	for i = 1, ControllerOccupyMode.ZoneBMax do
		self.zoneBList[i] = OccupyZone:new(self, ControllerOccupyMode.ZoneType.ZoneB, i)

		self.zoneBList[i]:SetScene(self.scene)
		self.zoneBList[i]:SetHostPlayer(self.hostPlayer)
		self.zoneBList[i]:SetTeam(1, team1)
		self.zoneBList[i]:SetTeam(2, team2)
		self.zoneBList[i]:StartZone()

		self.effZoneBEyeList[i] = nil
	end

	self.zoneC = OccupyZone:new(self, ControllerOccupyMode.ZoneType.ZoneC, 1)

	self.zoneC:SetScene(self.scene)
	self.zoneC:SetHostPlayer(self.hostPlayer)
	self.zoneC:SetTeam(1, team1)
	self.zoneC:SetTeam(2, team2)
	self.zoneC:StartZone()

	self.score1 = 0
	self.score2 = 0

	local scene = self.sceneController:GetScene()

	if scene ~= nil then
		local tfFlag = scene:GetVisibleObject("Arena10001_flag_all")

		if tfFlag ~= nil then
			for i = 1, 4 do
				local tmpName = "Arena10001_flag_" .. i
				local tmpTfFlag = TfFindChild(tfFlag, tmpName)

				if tmpTfFlag ~= nil then
					local tmpShow = ControllerOccupyMode.FlagShowList[self.hostPlayerTeamId][i]

					tmpTfFlag.gameObject:SetActive(tmpShow)
				end
			end
		end
	end

	self:ChangeStatus(ControllerOccupyMode.Status.Start)
end

function ControllerOccupyMode:ChangeStatus(status)
	self.status = status

	if self:IsStatus(ControllerOccupyMode.Status.Start) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", true)
	elseif self:IsStatus(ControllerOccupyMode.Status.Normal) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", false)

		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:Restart()
			end
		end
	elseif self:IsStatus(ControllerOccupyMode.Status.Result) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", false)
		self.sceneController:ChangeSubState(ControllerMain.MoveStep.ShowResult, 0, 0)
	end

	self.gameFrame = 0
end

function ControllerOccupyMode:IsStatus(status)
	if self.status == status then
		return true
	end

	return false
end

function ControllerOccupyMode:InitPlayer()
	FS_BattleData_OccupyMode.initialize(self.hostPlayerTeamId)

	local playerList = self.sceneController:GetPlayerList()

	for i, tmpPlayer in pairs(playerList) do
		local animalId = tmpPlayer:GetAnimalId()
		local teamId = tmpPlayer:GetTeamId()

		tmpPlayer:GetValue():SetRebornFrame(ControllerOccupyMode.PlayerBornFrame)
		tmpPlayer:GetValue():SetRebornEnable(true)

		if tmpPlayer == self.hostPlayer then
			UIManager.SendMessage("Mainmenu", "SetPlayer", self.hostPlayer:GetAnimalId(), self.hostPlayer:GetHeroId(), self.hostPlayer:GetTeamId())
		elseif self.hostPlayer:IsMyTeam(tmpPlayer:GetTeamId()) == true then
			UIManager.SendMessage("Mainmenu", "AddNpc", tmpPlayer:GetAnimalId(), tmpPlayer:GetHeroId(), tmpPlayer:GetTeamId())
		elseif self.hostPlayer:IsMyTeam(tmpPlayer:GetTeamId()) == false then
			UIManager.SendMessage("Mainmenu", "AddNpc", tmpPlayer:GetAnimalId(), tmpPlayer:GetHeroId(), tmpPlayer:GetTeamId())
		end

		local roomPlayer = FS_Battle_MatchGame.GetMatchPlayer(animalId)

		FS_BattleData_OccupyMode.AddPlayer(animalId, teamId, tmpPlayer:GetMemberId())
		FS_BattleData_OccupyMode.SetBattleData(animalId, FS_BattleData_OccupyMode.DataType.HeroId, tmpPlayer:GetHeroId())
		FS_BattleData_OccupyMode.SetBattleData(animalId, FS_BattleData_OccupyMode.DataType.UserName, roomPlayer:getUserName())
		FS_BattleData_OccupyMode.SetBattleData(animalId, FS_BattleData_OccupyMode.DataType.UserId, roomPlayer:getUserId())
	end
end

function ControllerOccupyMode:InitUI()
	UIManager.CreateCtrl("PVPBattleResult")

	self.showReadyProgressUI = false

	self:UpdateScore()
end

function ControllerOccupyMode:ShowHostUI()
	local showFlg = false

	if self.hostPlayer:IsDead() == false and self.hostPlayer:IsShow() == true then
		local tmpGroundType, tmpZoneType, tmpZoneId = self.hostPlayer:GetTouchGroundDataSimple()

		if tmpZoneType == ControllerOccupyMode.ZoneType.ZoneB and tmpZoneId > 0 then
			local ret, tId, tmpFrame, tmpFrameMax = self.zoneBList[tmpZoneId]:GetReadyStatus()

			if ret == true and tId == self.hostPlayerTeamId then
				local tmpRate = tmpFrame / tmpFrameMax

				tmpRate = Mathf.Clamp(tmpRate, 0, 1)

				UIManager.SendMessage("Mainmenu", "UpdateProgress", tmpRate, MainmenuCtrl.ProgressBarType.OccupySpot)

				self.showReadyProgressUI = true
				showFlg = true
			end
		elseif tmpZoneType == ControllerOccupyMode.ZoneType.ZoneC and tmpZoneId > 0 then
			local ret, tId, tmpFrame, tmpFrameMax = self.zoneC:GetReadyStatus()

			if ret == true and tId == self.hostPlayerTeamId then
				local tmpRate = tmpFrame / tmpFrameMax

				tmpRate = Mathf.Clamp(tmpRate, 0, 1)

				UIManager.SendMessage("Mainmenu", "UpdateProgress", tmpRate, MainmenuCtrl.ProgressBarType.OccupySpot)

				self.showReadyProgressUI = true
				showFlg = true
			end
		end
	end

	if showFlg == false and self.showReadyProgressUI == true then
		UIManager.SendMessage("Mainmenu", "CancelProgress")

		self.showReadyProgressUI = false
	end
end

function ControllerOccupyMode:OccupyZone(type, id, teamId)
	if type == ControllerOccupyMode.ZoneType.ZoneB then
		if self.effZoneBEyeList[id] ~= nil then
			self.effZoneBEyeList[id]:Clear()

			self.effZoneBEyeList[id] = 0
		end

		local effRootName = "effect_czone_eye_" .. id
		local tfEffZoneEye = self.scene:GetEffectRoot(effRootName)

		if tfEffZoneEye ~= nil then
			if teamId == self.hostPlayerTeamId then
				self.effZoneBEyeList[id] = VfxManager.PlayTransformFreezeMulti(tfEffZoneEye, "vfx_Arena10001_blueeye")
			else
				self.effZoneBEyeList[id] = VfxManager.PlayTransformFreezeMulti(tfEffZoneEye, "vfx_Arena10001_redeye")
			end
		end
	elseif type == ControllerOccupyMode.ZoneType.ZoneC then
		local effRootName = "effect_czone_ball"
		local tfEffZoneBall = self.scene:GetEffectRoot(effRootName)

		for i = 1, ControllerOccupyMode.ZoneBMax do
			local tId = self.zoneBList[i]:GetTeamId()

			if tId > 0 and tId == teamId then
				if teamId == 2 then
					self.score2 = self.score2 + 1
				elseif teamId == 1 then
					self.score1 = self.score1 + 1
				end

				local tmpEffRootName = "effect_czone_eye_" .. i
				local tfEffZoneEye = self.scene:GetEffectRoot(tmpEffRootName)
				local tmpEff

				if tId == self.hostPlayerTeamId then
					tmpEff = VfxManager.PlayBindMulti(tfEffZoneEye, "vfx_Arena10001_blueline")
				else
					tmpEff = VfxManager.PlayBindMulti(tfEffZoneEye, "vfx_Arena10001_redline")
				end

				if tmpEff ~= nil then
					local tmpRelative = tfEffZoneBall.position - tfEffZoneEye.position
					local tmpRot = Quaternion.LookRotation(tmpRelative)

					tmpEff:SetRotation(tmpRot.x, tmpRot.y, tmpRot.z, tmpRot.w)

					tmpRelative = nil
					tmpRot = nil
				end

				local tmpEffHit

				if tId == self.hostPlayerTeamId then
					tmpEffHit = VfxManager.PlayBindMulti(tfEffZoneBall, "vfx_Arena10001_bluehit")
				else
					tmpEffHit = VfxManager.PlayBindMulti(tfEffZoneBall, "vfx_Arena10001_redhit")
				end

				if tmpEffHit ~= nil then
					local tmpRelative = tfEffZoneEye.position - tfEffZoneBall.position
					local tmpRot = Quaternion.LookRotation(tmpRelative)

					tmpEffHit:SetRotation(tmpRot.x, tmpRot.y, tmpRot.z, tmpRot.w)

					tmpRelative = nil
					tmpRot = nil
				end
			end
		end

		if teamId == self.hostPlayerTeamId then
			VfxManager.PlayTransformFreezeMulti(tfEffZoneBall, "vfx_Arena10001_blueball")
		else
			VfxManager.PlayTransformFreezeMulti(tfEffZoneBall, "vfx_Arena10001_redball")
		end

		self:UpdateScore()
	end

	local tmpType, tmpId = self:ConvertZoneIdFromScene(type, id)
	local tmpIndex = self:ConvertZoneToUI(tmpType, tmpId)
	local tmpTeamId = self:ConvertHostTeamId(teamId)

	UIManager.SendMessage("Mainmenu", "ShowHudSpotOccupied", tmpIndex, tmpTeamId)
	UIManager.SendMessage("Mainmenu", "SetSpotOccupied", tmpIndex, tmpTeamId)
end

function ControllerOccupyMode:ConvertZoneToUI(type, id)
	if type == ControllerOccupyMode.ZoneType.ZoneB then
		return id
	elseif type == ControllerOccupyMode.ZoneType.ZoneC then
		return MainmenuCtrl.SpotName.Center
	end

	return 0
end

function ControllerOccupyMode:ConvertHostTeamId(teamId)
	local myTeamId = self.hostPlayer:GetTeamId()

	if myTeamId == 2 and teamId > 0 then
		teamId = 3 - teamId
	end

	return teamId
end

function ControllerOccupyMode:ConvertZoneIdFromScene(type, id)
	if type == ControllerOccupyMode.ZoneType.ZoneB and self.hostPlayerTeamId == 2 then
		if id == 1 or id == 3 then
			return type, 4 - id
		elseif id == 2 or id == 4 then
			return type, 6 - id
		end
	end

	return type, id
end

function ControllerOccupyMode:AddZoneUI(type, id)
	local tmpType, tmpId = self:ConvertZoneIdFromScene(type, id)
	local tmpIndex = self:ConvertZoneToUI(tmpType, tmpId)
	local tmpPos = self:GetZonePosition(type, id)

	tmpPos.y = tmpPos.y + 2

	UIManager.SendMessage("Mainmenu", "AddHudSpotIcon", tmpIndex, tmpPos)
end

function ControllerOccupyMode:UpdateZoneUI(type, id, teamId, teamReadyId, rate, showFlg)
	local tmpType, tmpId = self:ConvertZoneIdFromScene(type, id)
	local tmpIndex = self:ConvertZoneToUI(tmpType, tmpId)
	local tmpTeamId = self:ConvertHostTeamId(teamId)
	local tmpTeamReadyId = self:ConvertHostTeamId(teamReadyId)

	UIManager.SendMessage("Mainmenu", "SetHudSpotInfo", tmpIndex, tmpTeamId, tmpTeamReadyId, rate, showFlg)
end

function ControllerOccupyMode:ShowZoneWarning(type, id, showFlg)
	local tmpType, tmpId = self:ConvertZoneIdFromScene(type, id)
	local tmpIndex = self:ConvertZoneToUI(tmpType, tmpId)

	UIManager.SendMessage("Mainmenu", "SetHudSpotWarning", tmpIndex, showFlg)
end

function ControllerOccupyMode:GetZonePosition(type, id)
	local ret = Vector3.zero
	local tmptfZone = self.scene:GetLocatorZone(type, id)

	if tmptfZone ~= nil then
		ret:SetVector3(tmptfZone.position)
	end

	return ret
end

function ControllerOccupyMode:ShowZoneCRestTime(show)
	UIManager.SendMessage("Mainmenu", "ShowPvpTask", show)
end

function ControllerOccupyMode:SetZoneCRestTime(sec)
	UIManager.SendMessage("Mainmenu", "SetPvpTaskTimeRemaining", sec)
end

function ControllerOccupyMode:SetZoneCCountDown(sec)
	return
end

function ControllerOccupyMode:ShowZoneCCountDown(show)
	UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", show)
end

function ControllerOccupyMode:UpdateScore()
	local tmpRate1 = 0
	local tmpRate2 = 0

	self.score1 = Mathf.Clamp(self.score1, 0, ControllerOccupyMode.ScoreMax)
	self.score2 = Mathf.Clamp(self.score2, 0, ControllerOccupyMode.ScoreMax)

	if self.hostPlayerTeamId == 1 then
		tmpRate1 = self.score1 / ControllerOccupyMode.ScoreMax
		tmpRate2 = self.score2 / ControllerOccupyMode.ScoreMax
	else
		tmpRate1 = self.score2 / ControllerOccupyMode.ScoreMax
		tmpRate2 = self.score1 / ControllerOccupyMode.ScoreMax
	end

	UIManager.SendMessage("Mainmenu", "SetOccupyProgress", 1, tmpRate1)
	UIManager.SendMessage("Mainmenu", "SetOccupyProgress", 2, tmpRate2)

	if UIManager.GetCtrl("PVPBattleResult") ~= nil and UIManager.GetCtrl("PVPBattleResult").loadFinish then
		UIManager.SendMessage("PVPBattleResult", "UpdateScore", 1, self.score1)
		UIManager.SendMessage("PVPBattleResult", "UpdateScore", 2, self.score2)
	end

	if self.score1 >= ControllerOccupyMode.ScoreMax or self.score2 >= ControllerOccupyMode.ScoreMax then
		FS_BattleData_OccupyMode.SaveBattleResult(self.score1, self.score2, ControllerMain.ConvertFrameToSec(self.gameFrame))
		self:ChangeStatus(ControllerOccupyMode.Status.Result)
	end
end

function ControllerOccupyMode:CheckTime()
	if self:IsStatus(ControllerOccupyMode.Status.Normal) ~= true then
		return
	end

	local max = ControllerMain.ConvertSecondToFrame(ControllerOccupyMode.OccupyTimeMax)

	if max <= self.gameFrame then
		FS_BattleData_OccupyMode.SaveBattleResult(self.score1, self.score2, ControllerOccupyMode.OccupyTimeMax)
		self:ChangeStatus(ControllerOccupyMode.Status.Result)
	else
		self.gameFrame = self.gameFrame + 1
	end

	UIManager.SendMessage("Mainmenu", "SetOccupyTimer", ControllerMain.ConvertFrameToSec(max - self.gameFrame))
end

function ControllerOccupyMode:GameResultSubmit()
	ControllerModeBase.GameResultSubmit(self)
	ControllerOccupyMode.GameResult(nil)
end

function ControllerOccupyMode.GameResult(buffer)
	UIManager.CreateCtrl("BattleResult")
end

function ControllerOccupyMode:Update()
	ControllerModeBase.Update(self)

	if self:IsStatus(ControllerOccupyMode.Status.Start) then
		local max = ControllerMain.ConvertSecondToFrame(ControllerOccupyMode.OccupyStartTime)

		self.gameFrame = self.gameFrame + 1

		if max < self.gameFrame then
			self:ChangeStatus(ControllerOccupyMode.Status.Normal)
		end
	elseif self:IsStatus(ControllerOccupyMode.Status.Normal) then
		self:UpdateZone()
	end
end

function ControllerOccupyMode:UpdateZone()
	if self:IsStatus(ControllerOccupyMode.Status.Normal) ~= true then
		return
	end

	for i = 1, #self.zoneBList do
		local tmpZone = self.zoneBList[i]

		tmpZone:UpdateZone()
	end

	self.zoneC:UpdateZone()
	self:ShowHostUI()
	self:CheckTime()
end

function ControllerOccupyMode:Exit()
	ControllerModeBase.Exit(self)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_BATTLE_RESULT)

	for i = 1, ControllerOccupyMode.ZoneBMax do
		if self.zoneBList[i] ~= nil then
			self.zoneBList[i]:Exit()
		end
	end

	self.zoneBList = nil

	if self.zoneC ~= nil then
		self.zoneC:Exit()

		self.zoneC = nil
	end
end

return ControllerOccupyMode
