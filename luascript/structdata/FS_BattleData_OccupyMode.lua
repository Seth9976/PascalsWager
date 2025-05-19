-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_BattleData_OccupyMode.lua

FS_BattleData_OccupyMode = class("FS_BattleData_OccupyMode")
FS_BattleData_OccupyMode.battleDataList = {}
FS_BattleData_OccupyMode.battleDataTeam1 = {}
FS_BattleData_OccupyMode.battleDataTeam2 = {}
FS_BattleData_OccupyMode.hostTeamId = 1
FS_BattleData_OccupyMode.BattleTime = 0
FS_BattleData_OccupyMode.BattleScore1 = 0
FS_BattleData_OccupyMode.BattleScore2 = 0
FS_BattleData_OccupyMode.static.DataType = {
	SingleKillNumRatioMax = 12,
	KillNum = 7,
	ThreeTypeStart = 6,
	UserName = 2,
	Heal = 25,
	AssistNum = 16,
	LastKillNumRatioMax = 15,
	AttackDamageRatioMax = 21,
	LastKillNumRatio = 14,
	HeroId = 3,
	AcceptDamage = 22,
	AssistNumRatioMax = 18,
	AttackDamageRatio = 20,
	AcceptDamageRatioMax = 24,
	AttackDamage = 19,
	LiveTime = 5,
	DeathNum = 4,
	UserId = 1,
	AcceptDamageRatio = 23,
	KillNumRatio = 8,
	SingleKillNum = 10,
	HealRatio = 26,
	HealRatioMax = 27,
	LastKillNum = 13,
	DataTypeMax = 28,
	KillNumRatioMax = 9,
	SingleKillNumRatio = 11,
	AssistNumRatio = 17
}

function FS_BattleData_OccupyMode.initialize(hostTeamId)
	FS_BattleData_OccupyMode.battleDataList = {}
	FS_BattleData_OccupyMode.friendList = {}
	FS_BattleData_OccupyMode.enemyList = {}
	FS_BattleData_OccupyMode.hostTeamId = hostTeamId
end

function FS_BattleData_OccupyMode.AddPlayer(animalId, teamId, memberId)
	FS_BattleData_OccupyMode.battleDataList[animalId] = {}

	for i = 1, FS_BattleData_OccupyMode.DataType.DataTypeMax do
		FS_BattleData_OccupyMode.battleDataList[animalId][i] = 0
	end

	if teamId == 1 then
		FS_BattleData_OccupyMode.battleDataTeam1[memberId] = FS_BattleData_OccupyMode.battleDataList[animalId]
	elseif teamId == 2 then
		FS_BattleData_OccupyMode.battleDataTeam2[memberId] = FS_BattleData_OccupyMode.battleDataList[animalId]
	end
end

function FS_BattleData_OccupyMode.SetBattleData(animalId, type, value)
	if FS_BattleData_OccupyMode.battleDataList[animalId] ~= nil and FS_BattleData_OccupyMode.CheckType(type) == true then
		FS_BattleData_OccupyMode.battleDataList[animalId][type] = value

		if type == FS_BattleData_OccupyMode.DataType.KillNum or type == FS_BattleData_OccupyMode.DataType.DeathNum then
			local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

			if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 1 then
				UIManager.SendMessage("PVPBattleResult", "UpdatePanel")
			end
		end

		if FS_BattleData_OccupyMode.battleDataList[animalId][FS_BattleData_OccupyMode.DataType.UserId] == FS_UserData.playerList:GetUserId() then
			local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

			if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 2 then
				UIManager.SendMessage("PVPBattleResult", "UpdateSelf")
			end
		end

		if type > FS_BattleData_OccupyMode.DataType.ThreeTypeStart then
			FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] = value
		end
	end
end

function FS_BattleData_OccupyMode.AddBattleData(animalId, type, value)
	if FS_BattleData_OccupyMode.battleDataList[animalId] ~= nil and FS_BattleData_OccupyMode.CheckType(type) == true then
		FS_BattleData_OccupyMode.battleDataList[animalId][type] = FS_BattleData_OccupyMode.battleDataList[animalId][type] + value

		if type == FS_BattleData_OccupyMode.DataType.KillNum or type == FS_BattleData_OccupyMode.DataType.DeathNum then
			local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

			if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 1 then
				UIManager.SendMessage("PVPBattleResult", "UpdatePanel")
			end
		end

		if FS_BattleData_OccupyMode.battleDataList[animalId][FS_BattleData_OccupyMode.DataType.UserId] == FS_UserData.playerList:GetUserId() then
			local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

			if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 2 then
				UIManager.SendMessage("PVPBattleResult", "UpdateSelf")
			end
		end

		if type > FS_BattleData_OccupyMode.DataType.ThreeTypeStart then
			FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] = FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] + value
		end
	end
end

function FS_BattleData_OccupyMode.OverrideBattleData(animalId, type, value)
	if FS_BattleData_OccupyMode.battleDataList[animalId] ~= nil and FS_BattleData_OccupyMode.CheckType(type) == true then
		if value > FS_BattleData_OccupyMode.battleDataList[animalId][type] then
			FS_BattleData_OccupyMode.battleDataList[animalId][type] = value

			if type == FS_BattleData_OccupyMode.DataType.KillNum or type == FS_BattleData_OccupyMode.DataType.DeathNum then
				local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

				if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 1 then
					UIManager.SendMessage("PVPBattleResult", "UpdatePanel")
				end
			end

			if FS_BattleData_OccupyMode.battleDataList[animalId][FS_BattleData_OccupyMode.DataType.UserId] == FS_UserData.playerList:GetUserId() then
				local pvpPanel = UIManager.GetCtrl("PVPBattleResult")

				if pvpPanel ~= nil and pvpPanel.loadFinish and pvpPanel.isActive and pvpPanel.ActiveTab == 2 then
					UIManager.SendMessage("PVPBattleResult", "UpdateSelf")
				end
			end
		end

		if type > FS_BattleData_OccupyMode.DataType.ThreeTypeStart and value > FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] then
			FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] = value
		end
	end
end

function FS_BattleData_OccupyMode.ResetBattleDataRatio(animalId, type)
	if FS_BattleData_OccupyMode.battleDataList[animalId] ~= nil and FS_BattleData_OccupyMode.CheckType(type) == true and type > FS_BattleData_OccupyMode.DataType.ThreeTypeStart then
		local max = FS_BattleData_OccupyMode.battleDataList[animalId][type + 2]

		if max < FS_BattleData_OccupyMode.battleDataList[animalId][type + 1] then
			FS_BattleData_OccupyMode.battleDataList[animalId][type + 2] = FS_BattleData_OccupyMode.battleDataList[animalId][type + 1]
		end

		FS_BattleData_OccupyMode.battleDataList[animalId][type] = 0
	end
end

function FS_BattleData_OccupyMode.CheckType(type)
	if type > FS_BattleData_OccupyMode.DataType.ThreeTypeStart then
		local tmp = type - FS_BattleData_OccupyMode.DataType.ThreeTypeStart - 1

		if tmp % 3 == 0 then
			return true
		else
			return false
		end
	end

	return true
end

function FS_BattleData_OccupyMode.GetBattleData(animalId, type)
	local ret = 0

	if FS_BattleData_OccupyMode.battleDataList[animalId] == nil then
		return ret
	end

	ret = FS_BattleData_OccupyMode.battleDataList[animalId][type]

	return ret
end

function FS_BattleData_OccupyMode.SaveBattleResult(score1, score2, battleFrame)
	FS_BattleData_OccupyMode.BattleTime = battleFrame
	FS_BattleData_OccupyMode.BattleScore1 = score1
	FS_BattleData_OccupyMode.BattleScore2 = score2
end

function FS_BattleData_OccupyMode.GetBattleTime()
	return FS_BattleData_OccupyMode.BattleTime
end

function FS_BattleData_OccupyMode.GetFriendScore()
	if FS_BattleData_OccupyMode.hostTeamId == 1 then
		return FS_BattleData_OccupyMode.BattleScore1
	else
		return FS_BattleData_OccupyMode.BattleScore2
	end
end

function FS_BattleData_OccupyMode.GetEnemyScore()
	if FS_BattleData_OccupyMode.hostTeamId == 1 then
		return FS_BattleData_OccupyMode.BattleScore2
	else
		return FS_BattleData_OccupyMode.BattleScore1
	end
end

function FS_BattleData_OccupyMode.GetBattleResult()
	if FS_BattleData_OccupyMode.hostTeamId == 1 then
		if FS_BattleData_OccupyMode.BattleScore1 > FS_BattleData_OccupyMode.BattleScore2 then
			return BattleData.ResultType.Win
		elseif FS_BattleData_OccupyMode.BattleScore1 < FS_BattleData_OccupyMode.BattleScore2 then
			return BattleData.ResultType.Lose
		end
	elseif FS_BattleData_OccupyMode.hostTeamId == 2 then
		if FS_BattleData_OccupyMode.BattleScore1 < FS_BattleData_OccupyMode.BattleScore2 then
			return BattleData.ResultType.Win
		elseif FS_BattleData_OccupyMode.BattleScore1 > FS_BattleData_OccupyMode.BattleScore2 then
			return BattleData.ResultType.Lose
		end
	end

	return BattleData.ResultType.Draw
end

function FS_BattleData_OccupyMode.GetFriendData()
	if FS_BattleData_OccupyMode.hostTeamId == 1 then
		return FS_BattleData_OccupyMode.battleDataTeam1
	else
		return FS_BattleData_OccupyMode.battleDataTeam2
	end
end

function FS_BattleData_OccupyMode.GetEnemyData()
	if FS_BattleData_OccupyMode.hostTeamId == 1 then
		return FS_BattleData_OccupyMode.battleDataTeam2
	else
		return FS_BattleData_OccupyMode.battleDataTeam1
	end
end

function FS_BattleData_OccupyMode.GetOnePlayerDetailData(userid)
	for k, v in pairs(FS_BattleData_OccupyMode.battleDataList) do
		if v[FS_BattleData_OccupyMode.DataType.UserId] == userid then
			return v
		end
	end
end
