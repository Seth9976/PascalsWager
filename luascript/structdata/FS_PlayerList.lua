-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_PlayerList.lua

require("LuaScript/StructData/FS_PlayerData")

FS_PlayerList = class("FS_PlayerList")

function FS_PlayerList:initialize()
	self.userId = 1
	self.userName = "test" .. self.userId
	self.account = ""
	self.sign = ""
	self.timeSign = 0
	self.timeSignLocal = 0
	self.playerList = {}
	self.rank = {
		score = 0,
		wave = 0,
		ranking = 0
	}
end

function FS_PlayerList:Clear()
	self.rank = nil

	for k, v in pairs(self.playerList) do
		if v ~= nil then
			v:Clear()
		end
	end

	self.playerList = nil
end

function FS_PlayerList:Parse(p_val)
	if p_val ~= nil and p_val.players ~= nil then
		local num = #p_val.players

		SystemHelper.LogTest("====playerList===num= " .. num)

		if num > 0 then
			self.playerList = {}

			for i = 1, num do
				local tmpPlayer = p_val.players[i]

				SystemHelper.LogTest("=================tmpPlayer=" .. i .. "/" .. #p_val.players .. ",id=" .. tmpPlayer.id)

				local v_playerData = FS_PlayerData:new()

				v_playerData:Parse(tmpPlayer)
				table.insert(self.playerList, v_playerData)
			end
		end
	end
end

function FS_PlayerList:ParseEnter(p_val)
	if self.playerList == nil then
		self.playerList = {}

		local v_playerData = FS_PlayerData:new()

		v_playerData:Parse(p_val)
		table.insert(self.playerList, v_playerData)
	else
		local isExist = false

		for k, v in pairs(self.playerList) do
			if v.id == p_val.id then
				v:Parse(p_val)

				isExist = true
			end
		end

		if not isExist then
			local v_playerData = FS_PlayerData:new()

			v_playerData:Parse(p_val)
			table.insert(self.playerList, v_playerData)
		end
	end
end

function FS_PlayerList:Login(id, sign, time)
	SystemHelper.Log("[ FS_PlayerList:Login( id = " .. id .. ", sign = " .. sign .. ", time = " .. time)

	self.userId = tonumber(1)
	self.account = LS_Account.userName
	self.sign = sign
	self.timeSign = tonumber(time)
	self.timeSignLocal = os.time()
end

function FS_PlayerList:GetTimestamp()
	local nowTime = os.time()

	return nowTime + self.timeSign - self.timeSignLocal
end

function FS_PlayerList:ParseSelfRank(info)
	if info ~= nil then
		self.rank = info
	end
end

function FS_PlayerList:GetUserId()
	return self.userId
end

function FS_PlayerList:GetAccount()
	return self.account
end

function FS_PlayerList:GetSign()
	return self.sign
end

function FS_PlayerList:GetSignTime()
	return self.timeSign
end

function FS_PlayerList:GetPlayerListNum()
	return #self.playerList
end

function FS_PlayerList:IsHavePlayer()
	if #self.playerList > 0 then
		return true
	end

	return false
end

function FS_PlayerList:GetPlayer()
	local player = self.playerList[1]

	if player ~= nil then
		return player
	end

	SystemHelper.LogError("=============GetPlayer error !!!=====")

	return nil
end

function FS_PlayerList:GetPlayerId()
	local player = self.playerList[1]

	if player ~= nil then
		return player:GetId()
	end

	SystemHelper.LogError("=============GetPlayerId error !!!=====")

	return 0
end

return FS_PlayerList
