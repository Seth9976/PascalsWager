-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Achievement.lua

FS_Achievement = class("FS_Achievement")

function FS_Achievement:initialize()
	self.achievementFinishList = {}
	self.hasNew = 1
end

function FS_Achievement:Clear()
	self.achievementFinishList = nil
end

function FS_Achievement:Reset()
	self:Clear()
	self:initialize()
end

function FS_Achievement:Encode()
	local ret = {}

	ret.achievement_finish = self.achievementFinishList

	return ret
end

function FS_Achievement:UpdateForSteam()
	local ret = {}

	ret.achievement_finish = self.achievementFinishList

	local tmpJsonSubOnlyFinish = {}

	tmpJsonSubOnlyFinish.achievement = ret

	SdkHelper.SetAchievement(json.encode(tmpJsonSubOnlyFinish))
end

function FS_Achievement:EncodeFinishList()
	local ret = {}

	ret.achievement_finish = self.achievementFinishList

	return ret
end

function FS_Achievement:Decode(data)
	self.achievementFinishList = {}

	if data.achievement_finish ~= nil then
		for k, v in pairs(data.achievement_finish) do
			table.insert(self.achievementFinishList, tonumber(v))
		end
	end
end

function FS_Achievement:SmartDecode(data)
	if data.achievement_finish ~= nil then
		for k, v in pairs(data.achievement_finish) do
			if not table.contains(self.achievementFinishList, tonumber(v)) then
				table.insert(self.achievementFinishList, tonumber(v))
			end
		end
	end
end

function FS_Achievement:SendSuccess()
	self.hasNew = 0
end

function FS_Achievement:HasNew()
	return self.hasNew == 1
end

function FS_Achievement:AddAchievementValue(achievementId, value, recordId)
	local achievementData = MS_Achievement.GetAchievement(achievementId)

	if not table.contains(self.achievementFinishList, achievementId) then
		table.insert(self.achievementFinishList, achievementId)
		UIManager.SendMessage("MsgBoxSimple", "OpenGetAchievement", achievementData.Title, achievementData.Text, achievementData.Icon)

		local countOneloop = 0

		for k, v in pairs(self.achievementFinishList) do
			if v < MS_Achievement.BeforeSecondTime then
				countOneloop = countOneloop + 1
			end
		end

		if countOneloop == MS_Achievement.GetAchievement(MS_Achievement.AchievementIdType.GetAllAchievement).Max and not table.contains(self.achievementFinishList, MS_Achievement.AchievementIdType.GetAllAchievement) then
			table.insert(self.achievementFinishList, MS_Achievement.AchievementIdType.GetAllAchievement)

			local achievementData2 = MS_Achievement.GetAchievement(MS_Achievement.AchievementIdType.GetAllAchievement)

			UIManager.SendMessage("MsgBoxSimple", "OpenGetAchievement", achievementData2.Title, achievementData2.Text, achievementData2.Icon)
		end

		self.hasNew = 1

		LS_Achievement.Update()
	end
end

function FS_Achievement:GetAchievementValue(achievementId)
	if self.achievementList[achievementId] then
		return self.achievementList[achievementId]
	else
		return 0
	end
end

function FS_Achievement:GetAchievementFinished(achievementId)
	if table.contains(self.achievementFinishList, achievementId) then
		return true
	else
		return false
	end
end

function FS_Achievement:UpdateFor3dr()
	local achFinalList = self.achievementFinishList

	if achFinalList ~= nil then
		for i = 1, #achFinalList do
			SystemHelper.Log("achID:" .. achFinalList[i])
		end
	end
end

return FS_Achievement
