-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Rank.lua

FS_Rank = class("FS_Rank")

function FS_Rank:initialize()
	self.rankList = {}
end

function FS_Rank:Clear()
	self.rankList = nil
end

function FS_Rank:Parse(rankInfo)
	if rankInfo ~= nil then
		self.rankList = rankInfo
	end
end

function FS_Rank:GetRankList()
	return self.rankList
end

function FS_Rank:GetRankListNum()
	return #self.rankList
end

function FS_Rank:GetPlayerByRank(index)
	if self.rankList[index] ~= nil then
		return self.rankList[index]
	end

	return nil
end

return FS_Rank
