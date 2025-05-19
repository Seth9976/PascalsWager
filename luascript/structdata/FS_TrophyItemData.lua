-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_TrophyItemData.lua

require("LuaScript/StructData/FS_ItemData")

FS_TrophyItemData = class("FS_TrophyData", FS_ItemData)

function FS_TrophyItemData:initialize(id, level, subProperty, isNew, isLock, randomPropertyType, randomPropertyValue)
	FS_ItemData.initialize(self, id, 1, isNew)

	self.randomProperty = self.itemData.RandomProperty == 1

	if isLock == nil then
		self.isLock = 0
	else
		self.isLock = isLock
	end

	if self.randomProperty then
		if level then
			self.level = level
		else
			self.level = self.itemData.Level
		end

		if randomPropertyType ~= nil and randomPropertyValue ~= nil then
			self.randomPropertyType = randomPropertyType
			self.randomPropertyValue = randomPropertyValue
		else
			self.randomPropertyType, self.randomPropertyValue = self:RandomProperty(self.itemData)
		end
	else
		self.randomPropertyType = nil
		self.randomPropertyValue = nil

		if level then
			self.level = level
			self.mainPropertyList = {}

			if self.itemData.Property1 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property1 + self.level - self.itemData.Level)
			end

			if self.itemData.Property2 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property2 + self.level - self.itemData.Level)
			end

			if self.itemData.Property3 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property3 + self.level - self.itemData.Level)
			end

			if self.itemData.Property4 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property4 + self.level - self.itemData.Level)
			end
		else
			self.level = self.itemData.Level
			self.mainPropertyList = {}

			if self.itemData.Property1 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property1)
			end

			if self.itemData.Property2 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property2)
			end

			if self.itemData.Property3 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property3)
			end

			if self.itemData.Property4 ~= 0 then
				table.insert(self.mainPropertyList, self.itemData.Property4)
			end
		end
	end

	if subProperty then
		self.subProperty = subProperty
	else
		self.subProperty = 0
	end

	self.logicType = self.itemData.LogicType
	self.logicParam = self.itemData.LogicParam
	self.noOverlay = self.itemData.NoOverlay
	self.isEquiped = false
	self.equipUniqueId = self.itemData.EquipUniqueId
end

function FS_TrophyItemData:GetTrophyName()
	if self.level > 1 then
		return self:GetItemName() .. "+" .. self.level - 1
	else
		return self:GetItemName()
	end
end

function FS_TrophyItemData:GetLevel()
	return self.level
end

function FS_TrophyItemData:GetQuality()
	return self.itemData.Value1
end

function FS_TrophyItemData:CanEnchant()
	return self.itemData.EmotionType == 0
end

function FS_TrophyItemData:GetSubProperty()
	return self.subProperty
end

function FS_TrophyItemData:GetMainPropertyList()
	return self.mainPropertyList
end

function FS_TrophyItemData:SetEquiped(bool)
	self.isEquiped = bool
end

function FS_TrophyItemData:GetEquiped()
	return self.isEquiped
end

function FS_TrophyItemData:GetEquipUniqueId()
	return self.equipUniqueId
end

function FS_TrophyItemData:GetLogicType()
	return self.logicType
end

function FS_TrophyItemData:GetLogicParam()
	return self.logicParam
end

function FS_TrophyItemData:GetNoOverLay()
	return self.noOverlay == 1
end

function FS_TrophyItemData:Strength(levelDelta)
	self.level = self.level + levelDelta

	for k, v in pairs(self.mainPropertyList) do
		self.mainPropertyList[k] = v + levelDelta
	end
end

function FS_TrophyItemData:Recast(dir, level)
	self.subProperty = self:RecastSimulate(dir, level)
end

function FS_TrophyItemData:RecastSimulate(dir, level)
	local propertyId

	if self.subProperty ~= 0 then
		propertyId = self.subProperty
	elseif self.itemData.Property1 ~= 0 then
		local firstTimes = MathHelper.getRandom(1, 10)

		propertyId = self.itemData.Property1

		for i = 1, firstTimes do
			propertyId = self:JumpRecast(propertyId, dir)
		end
	else
		propertyId = 0
	end

	if propertyId ~= 0 then
		propertyId = math.floor(propertyId / 10) * 10 + level
	end

	propertyId = self:JumpRecast(propertyId, dir)

	return propertyId
end

function FS_TrophyItemData:JumpRecast(pId, dir)
	local trophyPropertyData = MS_TrophyProperty.GetTrophyPropertyData(pId)

	if trophyPropertyData == nil then
		SystemHelper.LogError("No Property" .. pId)

		return 0
	end

	local propertyId = trophyPropertyData[dir]
	local nextData = MS_TrophyProperty.GetTrophyPropertyData(propertyId)
	local nextType = nextData.PropertyType

	for k, v in pairs(self.mainPropertyList) do
		local tempData = MS_TrophyProperty.GetTrophyPropertyData(self.mainPropertyList[k])

		if tempData and tempData.PropertyType == nextType then
			return self:JumpRecast(propertyId, dir)
		end
	end

	local subData = MS_TrophyProperty.GetTrophyPropertyData(self.subProperty)

	if subData and subData.PropertyType == nextType then
		return self:JumpRecast(propertyId, dir)
	end

	return propertyId
end

function FS_TrophyItemData:GetIsLock()
	return self.isLock == 1
end

function FS_TrophyItemData:GetIsLockValue()
	return self.isLock
end

function FS_TrophyItemData:SetLock(bool)
	if bool then
		self.isLock = 1
	else
		self.isLock = 0
	end
end

function FS_TrophyItemData:IsRandomProperty()
	return self.randomProperty
end

function FS_TrophyItemData:GetRandomPropertyTypeList()
	return self.randomPropertyType
end

function FS_TrophyItemData:GetRandomPropertyValueList()
	return self.randomPropertyValue
end

function FS_TrophyItemData:RandomProperty(itemdata)
	local type = {}
	local value = {}

	for i = 1, 4 do
		if itemdata["Property" .. i] ~= 0 then
			local data = MS_TrophyRandomProperty.GetTrophyRandomPropertyData(itemdata["Property" .. i])

			table.insert(type, data.PropertyType)

			local s = Mathf.Floor((data.PropertyValueUpper - data.PropertyValueLower) / data.Step)
			local v = MathHelper.getRandomWithSeed(1, s, FS_UserData.story:GetRandomSeed()) * data.Step + data.PropertyValueLower

			table.insert(value, v)
		else
			table.insert(type, 0)
			table.insert(value, 0)
		end
	end

	return type, value
end

return FS_TrophyItemData
