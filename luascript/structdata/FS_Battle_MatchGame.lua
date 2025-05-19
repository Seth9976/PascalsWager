-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_MatchGame.lua

require("LuaScript/StructData/FS_Battle_MatchPlayer")

FS_Battle_MatchGame = class("FS_Battle_MatchGame")
FS_Battle_MatchGame.matchPlayerMax = 0
FS_Battle_MatchGame.matchEndTime = 0
FS_Battle_MatchGame.matchPlayerList = nil
FS_Battle_MatchGame.matchTeamList = nil
FS_Battle_MatchGame.matchPlayerSelf = nil
FS_Battle_MatchGame.historyFrameCount = 0

function FS_Battle_MatchGame.initialize()
	FS_Battle_MatchGame.matchPlayerMax = 0
	FS_Battle_MatchGame.matchEndTime = 0
	FS_Battle_MatchGame.matchPlayerList = {}
	FS_Battle_MatchGame.matchTeamList = {}
	FS_Battle_MatchGame.matchPlayerSelf = nil
	FS_Battle_MatchGame.historyFrameCount = 0
end

function FS_Battle_MatchGame.Parse(p_val)
	if p_val ~= nil then
		FS_Battle_MatchGame.matchEndTime = FS_Parser.toInt(p_val.goNextTime, FS_Battle_MatchGame.matchEndTime)

		if p_val.playerInfo ~= nil then
			local num = #p_val.playerInfo
			local memberIndexList = {}

			for i = 1, ControllerMain.TeamNumMax do
				memberIndexList[i] = 1
			end

			if num > 0 then
				for i = 1, num do
					local tmpPlayer = p_val.playerInfo[i]
					local userId = tmpPlayer.userId

					if FS_Battle_MatchGame.matchPlayerList[userId] ~= nil then
						FS_Battle_MatchGame.matchPlayerList[userId]:parse(tmpPlayer)
						FS_Battle_MatchGame.matchPlayerList[userId]:setIndex(i)
						FS_Battle_MatchGame.matchPlayerList[userId]:setMemberIndex(memberIndexList)
					else
						local v_playerData = FS_Battle_MatchPlayer:new()

						v_playerData:parse(tmpPlayer)
						v_playerData:setIndex(i)
						v_playerData:setMemberIndex(memberIndexList)

						FS_Battle_MatchGame.matchPlayerList[userId] = v_playerData
					end

					if FS_Battle_MatchGame.matchPlayerList[userId]:isMine() == true then
						FS_Battle_MatchGame.matchPlayerSelf = FS_Battle_MatchGame.matchPlayerList[userId]
					end
				end
			end
		end
	end
end

function FS_Battle_MatchGame.ParseConfirm(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
			if tmpPlayer.userId == p_val.userId then
				tmpPlayer:matchConfirm()
			end
		end
	end
end

function FS_Battle_MatchGame.ParseMatchGameTeam(p_val)
	if p_val ~= nil then
		FS_Battle_MatchGame.matchEndTime = FS_Parser.toInt(p_val.goNextTime, FS_Battle_MatchGame.matchEndTime)

		if p_val.teamInfo ~= nil then
			local tmpTeam = p_val.teamInfo
			local memberNum = #tmpTeam.teamMemberInfo
			local teamId = tmpTeam.teamId
			local memberIndexList = {}

			for i = 1, ControllerMain.TeamNumMax do
				memberIndexList[i] = 1
			end

			if memberNum > 0 then
				for i = 1, memberNum do
					local tmpMember = tmpTeam.teamMemberInfo[i]

					if tmpMember ~= nil then
						local userId = tmpMember.userId

						if FS_Battle_MatchGame.matchPlayerList[userId] ~= nil then
							FS_Battle_MatchGame.matchPlayerList[userId]:parse(tmpMember)
							FS_Battle_MatchGame.matchPlayerList[userId]:setIndex(i)
							FS_Battle_MatchGame.matchPlayerList[userId]:setMemberIndex(memberIndexList)
						else
							local v_playerData = FS_Battle_MatchPlayer:new()

							v_playerData:parse(tmpMember)
							v_playerData:setIndex(i)
							v_playerData:setMemberIndex(memberIndexList)

							FS_Battle_MatchGame.matchPlayerList[userId] = v_playerData
						end

						if FS_Battle_MatchGame.matchPlayerList[userId]:isMine() == true then
							FS_Battle_MatchGame.matchPlayerSelf = FS_Battle_MatchGame.matchPlayerList[userId]
						end

						table.insert(FS_Battle_MatchGame.matchTeamList, FS_Battle_MatchGame.matchPlayerList[userId])
					end
				end
			end
		end
	end
end

function FS_Battle_MatchGame.ParseChooseHero(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
			if tmpPlayer.userId == p_val.userId then
				tmpPlayer:parse(p_val)
			end
		end
	end
end

function FS_Battle_MatchGame.ParseChooseHeroConfirm(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
			if tmpPlayer.userId == p_val.userId then
				tmpPlayer:parse(p_val)
				tmpPlayer:heroConfirm()
			end
		end
	end
end

function FS_Battle_MatchGame.ParseChooseHeroFinish(p_val)
	if p_val ~= nil then
		FS_Battle_MatchGame.matchEndTime = FS_Parser.toInt(p_val.goNextTime, FS_Battle_MatchGame.matchEndTime)

		SystemHelper.LogTest("====FS_Battle_MatchGame.ParseChooseHeroFinish===matchEndTime=" .. FS_Battle_MatchGame.matchEndTime)

		local seed = 0

		seed = FS_Parser.toInt(p_val.randomSeed, seed)

		BattleData.SetBattleSeed(seed)

		FS_Battle_MatchGame.historyFrameCount = FS_Parser.toInt(p_val.frameLogCount, FS_Battle_MatchGame.historyFrameCount)

		if p_val.playerInfo ~= nil then
			local num = #p_val.playerInfo
			local memberIndexList = {}

			for i = 1, ControllerMain.TeamNumMax do
				memberIndexList[i] = 1
			end

			SystemHelper.LogTest("===============ParseChooseHeroFinish===num=" .. num)

			for i = 1, num do
				local tmpMember = p_val.playerInfo[i]

				if tmpMember ~= nil then
					local userId = tmpMember.userId

					if FS_Battle_MatchGame.matchPlayerList[userId] ~= nil then
						FS_Battle_MatchGame.matchPlayerList[userId]:parse(tmpMember)
						FS_Battle_MatchGame.matchPlayerList[userId]:setIndex(i)
						FS_Battle_MatchGame.matchPlayerList[userId]:setMemberIndex(memberIndexList)
					else
						local v_playerData = FS_Battle_MatchPlayer:new()

						v_playerData:parse(tmpMember)
						v_playerData:setIndex(i)
						v_playerData:setMemberIndex(memberIndexList)

						FS_Battle_MatchGame.matchPlayerList[userId] = v_playerData
					end

					if FS_Battle_MatchGame.matchPlayerList[userId]:isMine() == true then
						FS_Battle_MatchGame.matchPlayerSelf = FS_Battle_MatchGame.matchPlayerList[userId]
					end
				end
			end
		end
	end
end

function FS_Battle_MatchGame.ParseLoadProgress(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
			if tmpPlayer.userId == p_val.userId then
				tmpPlayer:parse(p_val)
			end
		end
	end
end

function FS_Battle_MatchGame.ParseChooseHeroFinishForPVE(p_val)
	if p_val ~= nil then
		FS_Battle_MatchGame.matchPlayerList = {}
		FS_Battle_MatchGame.matchEndTime = FS_Parser.toInt(p_val.goNextTime, FS_Battle_MatchGame.matchEndTime)

		SystemHelper.LogTest("====FS_Battle_MatchGame.ParseChooseHeroFinishForPVE===matchEndTime=" .. FS_Battle_MatchGame.matchEndTime)

		local seed = 0

		seed = FS_Parser.toInt(p_val.randomSeed, seed)

		BattleData.SetBattleSeed(seed)

		if p_val.playerInfo ~= nil then
			local num = #p_val.playerInfo
			local memberIndexList = {}

			for i = 1, ControllerMain.TeamNumMax do
				memberIndexList[i] = 1
			end

			for i = 1, num do
				local tmpMember = p_val.playerInfo[i]

				if tmpMember ~= nil then
					local userId = tmpMember.userId
					local v_playerData = FS_Battle_MatchPlayer:new()

					v_playerData:parse(tmpMember)
					v_playerData:setIndex(i)
					v_playerData:setMemberIndex(memberIndexList)

					FS_Battle_MatchGame.matchPlayerList[userId] = v_playerData

					if FS_Battle_MatchGame.matchPlayerList[userId]:isMine() == true then
						FS_Battle_MatchGame.matchPlayerSelf = FS_Battle_MatchGame.matchPlayerList[userId]
					end
				end
			end
		end
	end
end

function FS_Battle_MatchGame.isRoomMax()
	if FS_Battle_MatchGame.matchPlayerList ~= nil then
		local num = table.nums(FS_Battle_MatchGame.matchPlayerList)

		SystemHelper.LogTest("==isRoomMax===num=" .. num .. ",FS_Battle_MatchGame.matchPlayerMax=" .. FS_Battle_MatchGame.matchPlayerMax)

		if num == FS_Battle_MatchGame.matchPlayerMax then
			return true
		end
	end

	return false
end

function FS_Battle_MatchGame.isTeamMax()
	if FS_Battle_MatchGame.matchTeamList ~= nil then
		local num = table.nums(FS_Battle_MatchGame.matchTeamList)

		if num == Mathf.Ceil(FS_Battle_MatchGame.matchPlayerMax / 2) then
			return true
		end
	end

	return false
end

function FS_Battle_MatchGame.isGetAllTeamData()
	local num = 0

	if FS_Battle_MatchGame.matchPlayerList ~= nil then
		for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
			if tmpPlayer.heroId > 0 then
				num = num + 1
			end
		end
	end

	if num == FS_Battle_MatchGame.matchPlayerMax then
		return true
	end

	return false
end

function FS_Battle_MatchGame.GetMatchPlayerNum()
	if FS_Battle_MatchGame.matchPlayerList ~= nil then
		local num = table.nums(FS_Battle_MatchGame.matchPlayerList)

		return num
	end

	return 0
end

function FS_Battle_MatchGame.GetMatchPlayer(index)
	for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
		if tmpPlayer:getIndex() == index then
			return tmpPlayer
		end
	end

	return nil
end

function FS_Battle_MatchGame.GetSelf()
	for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
		if tmpPlayer:getUserId() == FS_UserData.playerList:GetUserId() then
			return tmpPlayer
		end
	end

	return nil
end

function FS_Battle_MatchGame.SetMatchPlayerMax(type)
	if type == BattleData.Type.PVP_1 then
		FS_Battle_MatchGame.matchPlayerMax = 2
	elseif type == BattleData.Type.PVP_2 then
		FS_Battle_MatchGame.matchPlayerMax = 4
	elseif type == BattleData.Type.PVP_5 then
		FS_Battle_MatchGame.matchPlayerMax = 10
	elseif type == BattleData.Type.PVE_Occupy or type == BattleData.Type.PVE_Guard or type == BattleData.Type.PVE_Custom or type == BattleData.Type.PVE_Story then
		FS_Battle_MatchGame.matchPlayerMax = BattleData.GetPVEPlayerNum()
	end
end

function FS_Battle_MatchGame.GetMatchPlayerMax()
	return FS_Battle_MatchGame.matchPlayerMax
end

function FS_Battle_MatchGame.GetTeamPlayer(isMyTeam)
	local team = {}

	for k, tmpPlayer in pairs(FS_Battle_MatchGame.matchPlayerList) do
		local flag = tmpPlayer:isMyTeam()

		if isMyTeam == flag then
			table.insert(team, tmpPlayer)
		end
	end

	return team
end
