-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_MatchPlayer.lua

FS_Battle_MatchPlayer = class("FS_Battle_MatchPlayer")

function FS_Battle_MatchPlayer:initialize()
	self.userId = 0
	self.playerIndex = 0
	self.memberIndex = 0
	self.name = ""
	self.icon = 0
	self.iconUrl = ""
	self.teamId = 0
	self.heroId = 0
	self.progress = 0
	self.confirmMatch = false
	self.confirmHero = false
end

function FS_Battle_MatchPlayer:setIndex(index)
	self.playerIndex = index
end

function FS_Battle_MatchPlayer:getIndex()
	return self.playerIndex
end

function FS_Battle_MatchPlayer:setMemberIndex(memberIndexList)
	if memberIndexList ~= nil and memberIndexList[self.teamId] ~= nil then
		self.memberIndex = memberIndexList[self.teamId]
		memberIndexList[self.teamId] = memberIndexList[self.teamId] + 1
	end
end

function FS_Battle_MatchPlayer:getMemberIndex()
	return self.memberIndex
end

function FS_Battle_MatchPlayer:getTeamId()
	return self.teamId
end

function FS_Battle_MatchPlayer:getUserName()
	return self.name
end

function FS_Battle_MatchPlayer:getUserId()
	return self.userId
end

function FS_Battle_MatchPlayer:parse(p_val)
	if p_val ~= nil and p_val.userId ~= nil then
		self.userId = FS_Parser.toInt(p_val.userId, self.userId)
		self.name = FS_Parser.toString(p_val.name, self.name)
		self.icon = FS_Parser.toInt(p_val.icon, self.icon)
		self.iconUrl = FS_Parser.toString(p_val.iconUrl, self.iconUrl)
		self.teamId = FS_Parser.toInt(p_val.teamId, self.teamId)
		self.heroId = FS_Parser.toInt(p_val.heroId, self.heroId)
		self.progress = FS_Parser.toInt(p_val.percent, self.progress)

		SystemHelper.LogTest("======================teamId = " .. self.teamId .. ",heroId=" .. self.heroId .. ",progress=" .. self.progress)
	end
end

function FS_Battle_MatchPlayer:matchConfirm()
	self.confirmMatch = true
end

function FS_Battle_MatchPlayer:isMatchConfirmed()
	return self.confirmMatch
end

function FS_Battle_MatchPlayer:heroConfirm()
	self.confirmHero = true
end

function FS_Battle_MatchPlayer:isHeroConfirmed()
	return self.confirmHero
end

function FS_Battle_MatchPlayer:choosedHeroId()
	return self.heroId
end

function FS_Battle_MatchPlayer:getProgress()
	return self.progress
end

function FS_Battle_MatchPlayer:isMine()
	if string.len(self.userId) > 0 and self.userId == FS_UserData.playerList:GetUserId() then
		return true
	end

	return false
end

function FS_Battle_MatchPlayer:isMyTeam()
	if FS_Battle_MatchGame.matchPlayerSelf == nil then
		return false
	end

	if self.teamId == FS_Battle_MatchGame.matchPlayerSelf.teamId then
		return true
	end

	return false
end

return FS_Battle_MatchPlayer
