-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_TrophyEquipList.lua

require("LuaScript/StructData/FS_ItemData")
require("LuaScript/StructData/MS_ItemData")

FS_TrophyEquipList = class("FS_TrophyEquipList")

function FS_TrophyEquipList:initialize()
	self.trophyList = {}
	self.propertyResult = {}

	for i = 1, MS_HeroData.PropertyMax do
		self.propertyResult[i] = 0
	end

	self.trophyLogicParam = {}
end

function FS_TrophyEquipList:Clear()
	if self.trophyList ~= nil then
		for k, v in pairs(self.trophyList) do
			if v ~= nil then
				v:Clear()
			end
		end
	end

	self.trophyList = nil

	for i = 1, MS_HeroData.PropertyMax do
		self.propertyResult[i] = 0
	end

	self.trophyLogicParam = {}
end

function FS_TrophyEquipList:Reset()
	self:Clear()
	self:initialize()
end

function FS_TrophyEquipList:Encode(isExit)
	local ret = {}

	ret.trophyList = {}

	if self.trophyList ~= nil then
		for k, v in pairs(self.trophyList) do
			if v ~= nil then
				local tmpPos = tonumber(k)
				local trophy = {}

				trophy.Id = v:GetItemId()
				trophy.Level = v:GetLevel()
				trophy.SubProperty = v:GetSubProperty()
				trophy.Lock = v:GetIsLockValue()
				trophy.RanT = v:GetRandomPropertyTypeList()
				trophy.RanV = v:GetRandomPropertyValueList()
				ret.trophyList[tmpPos] = trophy
			end
		end
	end

	return ret
end

function FS_TrophyEquipList:Decode(data)
	self:Clear()

	self.trophyList = {}

	if data.trophyList ~= nil then
		for k, v in pairs(data.trophyList) do
			if k ~= nil and v ~= nil then
				local tmpPos = tonumber(k)
				local v_itemData = FS_TrophyItemData:new(v.Id, v.Level, v.SubProperty, false, v.Lock, v.RanT, v.RanV)

				self.trophyList[tmpPos] = v_itemData

				v_itemData:SetEquiped(true)
			end
		end
	end

	self:UpdateAll()
end

function FS_TrophyEquipList:Equip(pos, trophy)
	local newTrophy = trophy

	if newTrophy == nil then
		return
	end

	if self.trophyList[pos] ~= nil then
		self:Remove(pos, false)
	end

	local anotherPos = self:GetTrophyPos(newTrophy)

	if anotherPos == 0 then
		self.trophyList[pos] = newTrophy

		FS_UserData.itemList:SubTrophyItem(newTrophy)
		newTrophy:SetEquiped(true)

		if newTrophy:IsRandomProperty() then
			local typeList = newTrophy:GetRandomPropertyTypeList()
			local valueList = newTrophy:GetRandomPropertyValueList()

			for i = 1, 4 do
				if typeList[i] ~= 0 then
					self.propertyResult[typeList[i]] = self.propertyResult[typeList[i]] + valueList[i]
				end
			end
		else
			local _mainPropertyList = newTrophy:GetMainPropertyList()

			for _k, _v in pairs(_mainPropertyList) do
				local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_v, newTrophy:GetQuality(), true)

				self.propertyResult[_type] = self.propertyResult[_type] + _value
			end
		end

		if newTrophy:GetSubProperty() ~= 0 then
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(newTrophy:GetSubProperty(), newTrophy:GetQuality(), true)

			self.propertyResult[_type] = self.propertyResult[_type] + _value
		end
	else
		self.trophyList[pos] = self.trophyList[anotherPos]
		self.trophyList[anotherPos] = nil
	end

	self:UpdateLogicParam()

	return newTrophy
end

function FS_TrophyEquipList:Remove(pos, thorough)
	if self.trophyList[pos] == nil then
		return
	end

	local trophy = self.trophyList[pos]

	trophy:SetEquiped(false)

	if trophy:IsRandomProperty() then
		local typeList = trophy:GetRandomPropertyTypeList()
		local valueList = trophy:GetRandomPropertyValueList()

		for i = 1, 4 do
			if typeList[i] ~= 0 then
				self.propertyResult[typeList[i]] = self.propertyResult[typeList[i]] - valueList[i]
			end
		end
	else
		local _mainPropertyList = trophy:GetMainPropertyList()

		for _k, _v in pairs(_mainPropertyList) do
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_v, trophy:GetQuality(), true)

			self.propertyResult[_type] = self.propertyResult[_type] - _value
		end
	end

	if trophy:GetSubProperty() ~= 0 then
		local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(trophy:GetSubProperty(), trophy:GetQuality(), true)

		self.propertyResult[_type] = self.propertyResult[_type] - _value
	end

	if thorough == false then
		FS_UserData.itemList:AddTrophyItem(self.trophyList[pos])
	end

	self.trophyList[pos] = nil

	self:UpdateLogicParam()
end

function FS_TrophyEquipList:GetUniqueTrophyPos(itemId)
	for k, v in pairs(self.trophyList) do
		if v:GetItemId() == itemId then
			return k
		end
	end

	return nil
end

function FS_TrophyEquipList:UpdateProperty()
	self.propertyResult = {}

	for i = 1, MS_HeroData.PropertyMax do
		self.propertyResult[i] = 0
	end

	for pos, trophy in pairs(self.trophyList) do
		if trophy:IsRandomProperty() then
			local typeList = trophy:GetRandomPropertyTypeList()
			local valueList = trophy:GetRandomPropertyValueList()

			for i = 1, 4 do
				if typeList[i] ~= 0 then
					self.propertyResult[typeList[i]] = self.propertyResult[typeList[i]] + valueList[i]
				end
			end
		else
			local _mainPropertyList = trophy:GetMainPropertyList()

			for _k, _v in pairs(_mainPropertyList) do
				local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(_v, trophy:GetQuality(), true)

				self.propertyResult[_type] = self.propertyResult[_type] + _value
			end
		end

		if trophy:GetSubProperty() ~= 0 then
			local _type, _value = MS_TrophyProperty.GetTrophyPropertyTypeAndValue(trophy:GetSubProperty(), trophy:GetQuality(), true)

			self.propertyResult[_type] = self.propertyResult[_type] + _value
		end
	end
end

function FS_TrophyEquipList:UpdateAll()
	self:UpdateProperty()
	self:UpdateLogicParam()
end

function FS_TrophyEquipList:UpdateLogicParam()
	self.trophyLogicParam = {}

	for pos, trophy in pairs(self.trophyList) do
		if trophy ~= nil then
			local logicType = trophy:GetLogicType()
			local logicParam = trophy:GetLogicParam()

			if logicType > 0 and logicParam > 0 then
				if self.trophyLogicParam[logicType] ~= nil then
					if trophy:GetNoOverLay() then
						if logicParam > self.trophyLogicParam[logicType] then
							self.trophyLogicParam[logicType] = logicParam
						end
					else
						self.trophyLogicParam[logicType] = self.trophyLogicParam[logicType] + logicParam
					end
				else
					self.trophyLogicParam[logicType] = logicParam
				end
			end
		end
	end
end

function FS_TrophyEquipList:Dead()
	local deleteIdList

	for pos, trophy in pairs(self.trophyList) do
		if trophy ~= nil then
			local logicType = trophy:GetLogicType()

			if logicType == MS_ItemData.TrophyLogicType.DeathDisappear then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, pos)
			end
		end
	end

	if deleteIdList ~= nil then
		for i = 1, #deleteIdList do
			self:Remove(deleteIdList[i], true)
		end
	end

	deleteIdList = nil
end

function FS_TrophyEquipList:GetLogicParam(logicType)
	if self.trophyLogicParam ~= nil and self.trophyLogicParam[logicType] ~= nil then
		return self.trophyLogicParam[logicType]
	end

	return 0
end

function FS_TrophyEquipList:GetTrophy(pos)
	local trophy = self.trophyList[pos]

	return trophy
end

function FS_TrophyEquipList:GetTrophyPos(trophy)
	for i = 1, MS_ItemData.TrophyMax do
		if self.trophyList[i] == trophy then
			return i
		end
	end

	return 0
end

function FS_TrophyEquipList:CheckExistTrophy(UniqueId)
	for k, v in pairs(self.trophyList) do
		if v:GetItemData().UniqueId == UniqueId then
			return true
		end
	end

	return false
end

function FS_TrophyEquipList:IsTrophyEquip(trophyId)
	for k, v in pairs(self.trophyList) do
		if v:GetItemId() == trophyId then
			return true
		end
	end

	return false
end

function FS_TrophyEquipList:GetAnotherSameTypeTrophy(pos)
	local newPos

	if pos % 2 == 0 then
		newPos = pos - 1
	else
		newPos = pos + 1
	end

	local trophy = self.trophyList[newPos]

	return trophy
end

function FS_TrophyEquipList:GetResult()
	return self.propertyResult
end

function FS_TrophyEquipList:GetTrophyCount()
	local Count = 0

	if self.trophyList ~= nil then
		for i = 1, MS_ItemData.TrophyMax do
			if self.trophyList[i] ~= nil then
				Count = Count + 1
			end
		end
	end

	return Count
end

return FS_TrophyEquipList
