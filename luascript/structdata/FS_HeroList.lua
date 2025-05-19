-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_HeroList.lua

require("LuaScript/StructData/FS_HeroData")

FS_HeroList = class("FS_HeroList")

function FS_HeroList:initialize()
	self.heroList = {}

	local heroIdList = MS_HeroData.GetEnableHeroIdList()

	for i = 1, #heroIdList do
		local heroId = tonumber(heroIdList[i])
		local v_heroData = FS_HeroData:new(heroId, heroId)

		self.heroList[heroId] = v_heroData
	end
end

function FS_HeroList:Clear()
	if self.heroList ~= nil then
		for k, v in pairs(self.heroList) do
			if v ~= nil then
				v:Clear()
			end
		end
	end

	self.heroList = nil
end

function FS_HeroList:Reset()
	if self.heroList ~= nil then
		for k, v in pairs(self.heroList) do
			if v ~= nil then
				v:Reset()
			end
		end
	else
		self.heroList = {}
	end
end

function FS_HeroList:AddHpToMax()
	if self.heroList ~= nil then
		for k, v in pairs(self.heroList) do
			if v ~= nil then
				v:AddHpToMax()
			end
		end
	end
end

function FS_HeroList:HaveAttributePoints(heroId)
	return self.heroList[heroId]:HaveAttributePoints()
end

function FS_HeroList:Encode(isExit)
	local ret = {}

	if self.heroList ~= nil then
		for k, v in pairs(self.heroList) do
			if v ~= nil then
				ret[k] = v:Encode(isExit)
			end
		end
	end

	return ret
end

function FS_HeroList:Decode(data)
	self:Reset()

	if self.heroList ~= nil and data ~= nil then
		local findDLCHero = false

		for k, v in pairs(data) do
			if v ~= nil then
				local heroId = tonumber(k)

				if heroId == 10005 then
					findDLCHero = true
				end

				if self.heroList[heroId] ~= nil then
					self.heroList[heroId]:Decode(v)
				end
			end
		end

		if findDLCHero == false and self.heroList[10005] ~= nil then
			self.heroList[10005]:SyncLevelExp(self.heroList[10001])
		end
	end
end

function FS_HeroList:GetHero(heroId)
	if self.heroList[heroId] ~= nil then
		return self.heroList[heroId]
	end

	return nil
end

function FS_HeroList:GetHeroList()
	if self.heroList then
		return self.heroList
	end

	return nil
end

function FS_HeroList:IsAllTalentMax(heroId)
	if heroId then
		local find = false

		for k, v in pairs(self.heroList) do
			if k == heroId then
				if not v:IsAllTalentMax() then
					return false
				end

				find = true
			end
		end

		return find
	else
		for k, v in pairs(self.heroList) do
			if k ~= MS_HeroData.DLCHeroId and k ~= MS_HeroData.ArcadeHeroId and not v:IsAllTalentMax() then
				return false
			end
		end

		return true
	end
end

function FS_HeroList:ParseHeroAttribute(p_val)
	if self.heroList[p_val.heroNo] ~= nil then
		self.heroList[p_val.heroNo]:ParseAttribute(p_val)
	end
end

function FS_HeroList:ParseHeroLevelExp(p_val)
	if self.heroList[p_val.heroNo] ~= nil then
		self.heroList[p_val.heroNo]:ParseLevelExp(p_val)
	end
end

function FS_HeroList:RestAllHeroAttribute()
	for k, v in pairs(self.heroList) do
		v:ResetAttribute()
	end
end

function FS_HeroList:ResetToChallenge(heroId, level, attList, withoutTalent)
	if withoutTalent then
		-- block empty
	else
		self.heroList[heroId]:AddTalentToMax()
	end

	self.heroList[heroId]:AddAttributeTo(attList)

	for k, v in pairs(self.heroList) do
		v:AddLevelTo(level)
	end
end

return FS_HeroList
