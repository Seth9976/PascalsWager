-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_HeroTalentCondition.lua

MS_HeroTalentCondition = class("MS_HeroTalentCondition")

function MS_HeroTalentCondition:initialize(id, type, condition)
	self.talentId = id
	self.talentType = type
	self.condition = nil

	if condition ~= "" then
		self.condition = {}

		local keyList = string.split(condition, ";")

		if type >= MS_HeroTalent.SkillTypeMin and type <= MS_HeroTalent.SkillTypeMax then
			for i = 1, #keyList do
				local indexList = string.split(keyList[i], ",")
				local tmpSkillIndex = tonumber(indexList[1])
				local tmpSkillCombo = tonumber(indexList[2])

				if tmpSkillIndex > 0 and tmpSkillCombo >= 0 then
					if self.condition[tmpSkillIndex] == nil then
						self.condition[tmpSkillIndex] = {}
					end

					self.condition[tmpSkillIndex][tmpSkillCombo] = 1
				end
			end
		else
			for i = 1, #keyList do
				local key = tonumber(keyList[i])

				if key > 0 then
					self.condition[key] = 1
				end
			end
		end
	end
end

function MS_HeroTalentCondition:IsConditionPermit(param1, param2)
	if self.talentType >= MS_HeroTalent.SkillTypeMin and self.talentType <= MS_HeroTalent.SkillTypeMax then
		if param1 > 0 and param2 > 0 then
			if self.condition == nil and self.talentType ~= MS_HeroTalent.Type.SkillOpen then
				return true
			elseif self.condition ~= nil and self.condition[param1] ~= nil then
				if self.condition[param1][0] ~= nil and self.condition[param1][0] > 0 then
					return true
				elseif self.condition[param1][param2] ~= nil and self.condition[param1][param2] > 0 then
					return true
				end
			end
		end
	elseif self.condition ~= nil then
		if param1 > 0 and self.condition[param1] ~= nil and self.condition[param1] > 0 then
			return true
		end
	else
		return true
	end

	return false
end

function MS_HeroTalentCondition:Exit()
	self.condition = nil
end

return MS_HeroTalentCondition
