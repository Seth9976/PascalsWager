-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_BattleRoom.lua

require("LuaScript/StructData/FS_Battle_MatchGame")

local BattleGameRoom_pb = require("LuaScript/Protocol/Protobuf/BattleGameRoom_pb")

NI_BattleRoom = class("NI_BattleRoom")

function NI_BattleRoom.MatchRoom()
	SystemHelper.LogTest("================NI_BattleRoom.MatchRoom========")

	local matchRoom = BattleGameRoom_pb.ReqMatchGameInZone()

	matchRoom.gameType = BattleData.GetType()

	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_MATCH_GAME_IN_ZONE)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
	SystemHelper.LogTest("================NI_BattleRoom.matchRoom====gameType====" .. matchRoom.gameType)
end

function NI_BattleRoom.ParseMatchRoom(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseMatchRoom============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespMatchGameInZone()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchRoom.Parse(msg)
	end
end

function NI_BattleRoom.JoinGame()
	SystemHelper.LogTest("================NI_BattleRoom.JoinGame========")

	local matchRoom = BattleGameRoom_pb.ReqRejoinGame()
	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_REJOIN_GAME)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseMatchGame(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseMatchGame============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespMatchedPlayerList()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.Parse(msg)
	end
end

function NI_BattleRoom.MatchRejoinGame()
	SystemHelper.LogTest("================NI_BattleRoom.MatchRejoinGame========")

	local matchRoom = BattleGameRoom_pb.ReqRejoinGame()
	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_REJOIN_GAME)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.CheckMatchRoom()
	SystemHelper.LogTest("================NI_BattleRoom.CheckMatchRoom========")

	local matchRoom = BattleGameRoom_pb.ReqCheckIsInZone()
	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CHECK_IS_IN_ZONE)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseCheckRoom(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseCheckRoom============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespCheckIsInZone()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchRoom.ParseCheckRoom(msg)
	end
end

function NI_BattleRoom.MatchGameCancel()
	SystemHelper.LogTest("================NI_BattleRoom.MatchGameCancel========")

	local matchRoom = BattleGameRoom_pb.ReqCancelMatchGame()
	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CANCEL_MATCH_GAME)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.MatchGameConfirm()
	SystemHelper.LogTest("================NI_BattleRoom.MatchConfirm========")

	local matchRoom = BattleGameRoom_pb.ReqConfirmEnterGame()
	local msg = matchRoom:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CONFIRM_ENTER_GAME)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseMatchGameConfirm(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseMatchGameConfirm============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespConfirmEnterGame()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseConfirm(msg)
	end
end

function NI_BattleRoom.ParseMatchGameTeam(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseMatchGameTeam============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespBeginChoosingHero()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseMatchGameTeam(msg)
	end
end

function NI_BattleRoom.ChooseHeroId(id)
	local chooseHero = BattleGameRoom_pb.ReqChooseHero()

	chooseHero.heroId = tonumber(id)

	SystemHelper.LogTest("================ NI_BattleRoom ChooseHeroId============" .. id)

	local msg = chooseHero:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CHOOSE_HERO)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseChooseHero(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseChooseHero============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespChooseHero()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseChooseHero(msg)
	end
end

function NI_BattleRoom.ConfirmHeroId()
	local confirmHero = BattleGameRoom_pb.ReqConfirmHero()
	local msg = confirmHero:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CONFIRM_HERO)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseChooseHeroConfirm(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseChooseHeroConfirm============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespConfirmHero()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseChooseHeroConfirm(msg)
	end
end

function NI_BattleRoom.ParseChooseHeroFinish(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseChooseHeroFinish============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespBeginGameLoading()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseChooseHeroFinish(msg)
	end
end

function NI_BattleRoom.SendLoadProgress(progress)
	local loading = BattleGameRoom_pb.ReqClientLoadingUpdate()

	loading.percent = progress

	local msg = loading:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToRoom.REQ_CLIENT_LOADING_UPDATE)
	buffer:WriteBuffer(msg)
	networkMgr:SendMessage(buffer)
end

function NI_BattleRoom.ParseLoadProgress(buffer)
	SystemHelper.LogTest("================ NI_BattleRoom ParseLoadProgress============")

	local data = buffer:ReadBuffer()
	local msg = BattleGameRoom_pb.RespClientLoadingUpdate()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_MatchGame.ParseLoadProgress(msg)
	end
end

function NI_BattleRoom.EnterRoomPVE()
	local enterRoom = {}

	enterRoom.goNextTime = 9999
	enterRoom.randomSeed = MathHelper.getRandom(1, 9999)

	local max = FS_Battle_MatchGame.GetMatchPlayerMax()
	local friendIndex = 1
	local enemyIndex = 1
	local callIndex = 1

	SystemHelper.LogTest("==EnterRoomPVE===GetHostNum=" .. BattleData.GetHostNum() .. ",GetFriendNum=" .. BattleData.GetFriendNum() .. ",GetEnemyNum=" .. BattleData.GetEnemyNum())

	enterRoom.playerInfo = {}

	for i = 1, max do
		local info = {}

		if i <= BattleData.GetHostNum() then
			info.userId = FS_UserData.playerList:GetUserId() + i - 1
			info.heroId = tonumber(BattleData.GetHostHeroId(i))
			info.teamId = 1
			info.name = FS_UserData.playerList:GetPlayer():GetName()
		elseif i <= BattleData.GetHostNum() + BattleData.GetFriendNum() then
			info.userId = FS_UserData.playerList:GetUserId() + i
			info.teamId = 1
			info.heroId = tonumber(BattleData.GetFriendHeroId(friendIndex))
			info.name = "电脑(睿智的)"
			friendIndex = friendIndex + 1
		elseif i <= BattleData.GetHostNum() + BattleData.GetFriendNum() + BattleData.GetEnemyNum() then
			info.userId = FS_UserData.playerList:GetUserId() + i
			info.teamId = 2
			info.heroId = tonumber(BattleData.GetEnemyHeroId(enemyIndex))
			info.name = "电脑(睿智的)"
			enemyIndex = enemyIndex + 1
		else
			info.userId = FS_UserData.playerList:GetUserId() + i
			info.teamId = 0
			info.heroId = tonumber(BattleData.GetCallHeroId(callIndex))
			callIndex = callIndex + 1
		end

		enterRoom.playerInfo[i] = info
	end

	FS_Battle_MatchGame.ParseChooseHeroFinishForPVE(enterRoom)
end
