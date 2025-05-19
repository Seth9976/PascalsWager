-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerFreeMode.lua

require("LuaScript/Controller/ControllerModeBase")
require("LuaScript/StructData/FS_Battle_MatchGame")

ControllerFreeMode = class("ControllerFreeMode", ControllerModeBase)
ControllerFreeMode.static.RoundReadyTime = 0
ControllerFreeMode.static.RoundDeadTime = 5
ControllerFreeMode.static.ShowRoundAnimateTime = 0
ControllerFreeMode.static.RoundTimeMax = 300
ControllerFreeMode.static.RoundMax = 1
ControllerFreeMode.static.Status = {
	Dead = 4,
	Result = 5,
	Ready = 2,
	Start = 1,
	Normal = 3
}
ControllerFreeMode.static.VfxList = {}

function ControllerFreeMode:initialize()
	ControllerModeBase.initialize(self)

	self.gameFrameMax = 0
	self.gameFrame = 0

	self:InitRound()
	self:InitPlayer()
	self:InitUI()
	self:ChangeStatus(ControllerFreeMode.Status.Start)
	self.sceneController:EnterNormal()
end

function ControllerFreeMode:InitRound()
	local team1 = self.sceneController:GetTeamList(1)
	local team2 = self.sceneController:GetTeamList(2)

	self.hostPlayerTeamId = self.hostPlayer:GetTeamId()
	self.score1 = 0
	self.score2 = 0
	self.roundResult = BattleData.ResultType.Draw
end

function ControllerFreeMode:ChangeStatus(status)
	self.status = status

	if self:IsStatus(ControllerFreeMode.Status.Start) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", true)
	elseif self:IsStatus(ControllerFreeMode.Status.Ready) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", true)

		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil and tmpPlayer:GetValue() ~= nil then
				tmpPlayer:Show()
				tmpPlayer:Reborn(true, nil)
				tmpPlayer:PressReborn()
				tmpPlayer:Stop()
			end
		end
	elseif self:IsStatus(ControllerFreeMode.Status.Normal) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", false)
		UIManager.SendMessage("Mainmenu", "ShowRoundMsg", ControllerFreeMode.ShowRoundAnimateTime, self.score1 + self.score2 + 1, nil)

		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:Restart()
			end
		end

		self.sceneController:ShowShadow(true)
	elseif self:IsStatus(ControllerFreeMode.Status.Dead) then
		UIManager.SendMessage("Mainmenu", "ShowTimeCountDown", false)
		UIManager.SendMessage("Mainmenu", "ShowRoundMsg", ControllerFreeMode.ShowRoundAnimateTime, nil, self.roundResult)

		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:Stop()
			end
		end

		self.gameFrameMax = self.gameFrameMax + self.gameFrame

		self:UpdateScore()
	elseif self:IsStatus(ControllerFreeMode.Status.Result) then
		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:Stop()
			end
		end

		self.sceneController:ChangeSubState(ControllerMain.MoveStep.ShowResult, 0, 0)
	end

	self.gameFrame = 0
end

function ControllerFreeMode:IsStatus(status)
	if self.status == status then
		return true
	end

	return false
end

function ControllerFreeMode:InitPlayer()
	FS_BattleData_OccupyMode.initialize(self.hostPlayerTeamId)

	self.team1List = self.sceneController:GetTeamList(1)
	self.team2List = self.sceneController:GetTeamList(2)

	local playerList = self.sceneController:GetPlayerList()

	for i, tmpPlayer in pairs(playerList) do
		local animalId = tmpPlayer:GetAnimalId()
		local teamId = tmpPlayer:GetTeamId()

		tmpPlayer:GetValue():SetRebornEnable(false)

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

function ControllerFreeMode:InitUI()
	self:UpdateScore()
end

function ControllerFreeMode:UpdateScore()
	local tmpScore1 = self.score1
	local tmpScore2 = self.score2

	if self.hostPlayerTeamId == 2 then
		tmpScore2 = self.score1
		tmpScore1 = self.score2
	end
end

function ControllerFreeMode:CheckScore()
	self:ChangeStatus(ControllerFreeMode.Status.Ready)
end

function ControllerFreeMode:CheckTime()
	if self:IsStatus(ControllerFreeMode.Status.Normal) ~= true then
		return
	end

	local max = ControllerMain.ConvertSecondToFrame(ControllerFreeMode.RoundTimeMax)

	self.gameFrame = self.gameFrame + 1

	UIManager.SendMessage("Mainmenu", "SetOccupyTimer", ControllerMain.ConvertFrameToSec(self.gameFrame))
end

function ControllerFreeMode:GetResult()
	local ret = BattleData.ResultType.Draw

	if self.hostPlayerTeamId == 1 then
		if self.score1 > self.score2 then
			ret = BattleData.ResultType.Win
		elseif self.score1 < self.score2 then
			ret = BattleData.ResultType.Lose
		end
	elseif self.score2 > self.score1 then
		ret = BattleData.ResultType.Win
	elseif self.score2 < self.score1 then
		ret = BattleData.ResultType.Lose
	end

	return ret
end

function ControllerFreeMode:GameResultSubmit()
	ControllerModeBase.GameResultSubmit(self)
	ControllerFreeMode.GameResult(nil)
end

function ControllerFreeMode.GameResult(buffer)
	UIManager.CreateCtrl("BattleResult")
end

function ControllerFreeMode:Update()
	ControllerModeBase.Update(self)
	self:UpdateStatus()
end

function ControllerFreeMode:UpdateStatus()
	if self:IsStatus(ControllerFreeMode.Status.Ready) or self:IsStatus(ControllerFreeMode.Status.Start) then
		local max = ControllerMain.ConvertSecondToFrame(ControllerFreeMode.RoundReadyTime)

		self.gameFrame = self.gameFrame + 1

		if max < self.gameFrame then
			self:ChangeStatus(ControllerFreeMode.Status.Normal)
		end
	elseif self:IsStatus(ControllerFreeMode.Status.Normal) then
		local team1Alive = false

		for i, tmpPlayer in pairs(self.team1List) do
			if tmpPlayer ~= nil and tmpPlayer:IsDead() == false then
				team1Alive = true

				break
			end
		end

		local team2Alive = false

		for i, tmpPlayer in pairs(self.team2List) do
			if tmpPlayer ~= nil and tmpPlayer:IsDead() == false then
				team2Alive = true

				break
			end
		end

		if team1Alive == false or team2Alive == false then
			self.roundResult = BattleData.ResultType.Draw

			if team1Alive == true and team2Alive == false then
				self.score1 = self.score1 + 1

				if self.hostPlayerTeamId == 1 then
					self.roundResult = BattleData.ResultType.Win
				else
					self.roundResult = BattleData.ResultType.Lose
				end
			elseif team1Alive == false and team2Alive == true then
				self.score2 = self.score2 + 1

				if self.hostPlayerTeamId == 1 then
					self.roundResult = BattleData.ResultType.Lose
				else
					self.roundResult = BattleData.ResultType.Win
				end
			end

			self:ChangeStatus(ControllerFreeMode.Status.Dead)
		end

		self:CheckTime()
	elseif self:IsStatus(ControllerFreeMode.Status.Dead) then
		local max = ControllerMain.ConvertSecondToFrame(ControllerFreeMode.RoundDeadTime)

		self.gameFrame = self.gameFrame + 1

		if max < self.gameFrame then
			self:CheckScore()
		end
	end
end

function ControllerFreeMode:Exit()
	ControllerModeBase.Exit(self)
	XNetwork.RemoveListener(XProtocol.BattleProtocolToRoom.RESP_BATTLE_RESULT)
end

return ControllerFreeMode
