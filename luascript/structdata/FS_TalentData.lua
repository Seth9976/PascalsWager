-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_TalentData.lua

FS_TalentData = class("FS_TalentData")

function FS_TalentData:initialize(id, level)
	self.talentId = id
	self.talentLevel = level
	self.talentData = MS_HeroTalent.GetHeroTalentData(id)
	self.preTalentId = self.talentData.PreTalent
	self.preTalentPos = 0

	if self.preTalentId ~= 0 then
		local pre = MS_HeroTalent.GetHeroTalentData(self.talentData.PreTalent)

		if pre ~= nil then
			self.preTalentPos = pre.TalentPos
		end
	end

	self.preTalent = nil

	if self.talentData ~= nil then
		if self.talentData.StoneLevel == nil or self.talentData.StoneLevel == "" then
			self.StoneLevelList = {}
		else
			self.StoneLevelList = StringHelper.Split(self.talentData.StoneLevel, ",")
		end

		self.talentLevelMax = #self.StoneLevelList

		if self.talentLevelMax == 0 then
			self.talentLevelMax = 1
		end

		if self.talentLevel > self.talentLevelMax then
			self.talentLevel = self.talentLevelMax
		end

		if AppVer == AppAppleLight or AppVer == AppTapTapCloudDemo then
			self.talentLevel = self.talentLevelMax
		elseif self.talentData.DefaultOpen == 1 and self.talentLevel < 1 then
			self.talentLevel = 1
		end
	end
end

function FS_TalentData:Clear()
	self.talentData = nil
end

function FS_TalentData:GetTalentData()
	return self.talentData
end

function FS_TalentData:GetPreTalent()
	return self.preTalent
end

function FS_TalentData:SetPreTalent(talent)
	self.preTalent = talent
end

function FS_TalentData:GetPreTalentPos()
	return self.preTalentPos
end

function FS_TalentData:GetPreTalentId()
	return self.preTalentId
end

function FS_TalentData:GetTalentId()
	return self.talentId
end

function FS_TalentData:GetStoneLevelList()
	return self.StoneLevelList
end

function FS_TalentData:IsStoneEnough(stoneLevel)
	stoneLevel = tostring(stoneLevel)

	if table.contains(self.StoneLevelList, stoneLevel) then
		for i = 1, self.talentLevel do
			if self.StoneLevelList[i] == stoneLevel then
				return true
			end
		end

		return false
	else
		return true
	end
end

function FS_TalentData:GetTalentLevel()
	if DebugTalentOpenAll then
		if self.talentLevel == nil or self.talentLevel < 1 then
			return 1
		else
			return self.talentLevel
		end
	end

	return self.talentLevel
end

function FS_TalentData:GetTalentLevelMax()
	return self.talentLevelMax
end

function FS_TalentData:IsTalentMax()
	if DebugTalentOpenAll then
		return FS_TalentData:GetTalentLevel() >= self.talentLevelMax
	end

	return self.talentLevel >= self.talentLevelMax
end

function FS_TalentData:AddToMax()
	self.talentLevel = self.talentLevelMax
end

function FS_TalentData:TalentLevelUp(level)
	if self.talentLevel + level > self.talentLevelMax or self.talentLevel + level < 0 then
		return
	end

	self.talentLevel = self.talentLevel + level
end

return FS_TalentData
