-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ItemList.lua

require("LuaScript/StructData/FS_ItemData")
require("LuaScript/StructData/MS_ItemData")
require("LuaScript/StructData/FS_TrophyItemData")

FS_ItemList = class("FS_ItemList")

function FS_ItemList:initialize()
	self.itemList = {}
	self.trophyList = {}
end

function FS_ItemList:Clear()
	if self.itemList ~= nil then
		for k, v in pairs(self.itemList) do
			if v ~= nil then
				v:Clear()
			end
		end
	end

	if self.trophyList ~= nil then
		for k, v in pairs(self.trophyList) do
			if v ~= nil then
				v:Clear()
			end
		end
	end

	self.trophyList = nil
	self.itemList = nil
end

function FS_ItemList:Reset()
	self:Clear()
	self:initialize()
end

function FS_ItemList:Encode(isExit)
	local ret = {}

	ret.item = {}
	ret.trophy = {}

	if self.itemList ~= nil then
		for k, v in pairs(self.itemList) do
			if v ~= nil then
				local tmpId = tonumber(k)

				ret.item[tmpId] = v:GetNum()
			end
		end
	end

	if self.trophyList ~= nil then
		for k, v in pairs(self.trophyList) do
			if v ~= nil then
				local tmpId = tonumber(k)
				local trophy = {}

				trophy.Id = v:GetItemId()
				trophy.Level = v:GetLevel()
				trophy.SubProperty = v:GetSubProperty()
				trophy.Lock = v:GetIsLockValue()
				trophy.RanT = v:GetRandomPropertyTypeList()
				trophy.RanV = v:GetRandomPropertyValueList()

				table.insert(ret.trophy, trophy)
			end
		end
	end

	return ret
end

function FS_ItemList:Decode(data)
	self:Clear()

	self.itemList = {}
	self.trophyList = {}

	if data.item ~= nil then
		for k, v in pairs(data.item) do
			if k ~= nil and v ~= nil then
				local tmpId = tonumber(k)
				local tmpNum = tonumber(v)

				self.itemList[tmpId] = FS_ItemData:new(tmpId, tmpNum)
			end
		end
	end

	if data.trophy ~= nil then
		for k, v in pairs(data.trophy) do
			if k ~= nil and v ~= nil then
				local v_itemData = FS_TrophyItemData:new(v.Id, v.Level, v.SubProperty, false, v.Lock, v.RanT, v.RanV)

				table.insert(self.trophyList, v_itemData)
			end
		end
	end

	self:CheckNoobItem()
end

function FS_ItemList:IsAnyTrophyNew()
	for k, v in pairs(self.trophyList) do
		if v.isNew then
			return true
		end
	end

	return false
end

function FS_ItemList:IsAnyTrophyNewByType(type)
	for k, v in pairs(self.trophyList) do
		if v.itemType == type and v.isNew then
			return true
		end
	end

	return false
end

function FS_ItemList:CheckNoobItem()
	if self.itemList[MS_ItemData.NoobItem] == nil then
		BattleData.SetNoobItem(false)
		UIManager.SendMessage("Mainmenu", "ShowSpecialStatus", false)
	else
		BattleData.SetNoobItem(true)
		UIManager.SendMessage("Mainmenu", "ShowSpecialStatus", true)
	end
end

function FS_ItemList:Restart()
	local idList = {}

	for k, v in pairs(self.itemList) do
		if v:GetItemData().GamePlusRemove == 1 then
			table.insert(idList, k)
		end
	end

	for _, id in pairs(idList) do
		self.itemList[id] = nil
	end

	self.itemList[MS_ItemData.NoobItem] = nil

	self:CheckNoobItem()
end

function FS_ItemList:CreateTrophyItem(itemId, level, subProperty, isNew, isLock)
	local v_itemData = FS_TrophyItemData:new(itemId, level, subProperty, isNew, isLock)

	table.insert(self.trophyList, v_itemData)
	table.sort(self.trophyList, function(a, b)
		if tonumber(a:GetItemId()) == tonumber(b:GetItemId()) then
			return tonumber(a:GetLevel()) < tonumber(b:GetLevel())
		else
			return tonumber(a:GetItemId()) < tonumber(b:GetItemId())
		end
	end)

	return v_itemData
end

function FS_ItemList:AddTrophyItem(trophy)
	if table.contains(self.trophyList, trophy) then
		SystemHelper.Log("exist trophy!")
	else
		table.insert(self.trophyList, trophy)
		table.sort(self.trophyList, function(a, b)
			if tonumber(a:GetItemId()) == tonumber(b:GetItemId()) then
				return tonumber(a:GetLevel()) < tonumber(b:GetLevel())
			else
				return tonumber(a:GetItemId()) < tonumber(b:GetItemId())
			end
		end)
	end

	return trophy
end

function FS_ItemList:CheckExistTrophy(UniqueId)
	for k, v in pairs(self.trophyList) do
		if v:GetItemData().UniqueId == UniqueId then
			return true
		end
	end

	return false
end

function FS_ItemList:GetUniqueTrophy(itemId)
	for k, v in pairs(self.trophyList) do
		if v:GetItemId() == itemId then
			return v
		end
	end

	return nil
end

function FS_ItemList:SubTrophyItem(trophy)
	if table.contains(self.trophyList, trophy) then
		table.removeValue(self.trophyList, trophy)

		return true
	else
		SystemHelper.Log("cant find trophy!")
	end

	return false
end

function FS_ItemList:AddBagItem(itemId, itemNum, isNew)
	if self.itemList[itemId] ~= nil then
		self.itemList[itemId]:AddNum(itemNum)
	else
		local v_itemData = FS_ItemData:new(itemId, itemNum, isNew)

		self.itemList[itemId] = v_itemData
	end

	self:CheckNoobItem()

	return self.itemList[itemId]
end

function FS_ItemList:UseBagItem(itemId, itemNum)
	if self.itemList[itemId] ~= nil and self.itemList[itemId]:GetNum() > 0 then
		if itemNum > self.itemList[itemId]:GetNum() then
			SystemHelper.Log("[ item is not enough  ]")

			return 0
		else
			local num = self.itemList[itemId]:UseItem(itemNum)

			if self:GetItemNum(itemId) == 0 then
				self.itemList[itemId] = nil
			end

			self:CheckNoobItem()

			return num
		end
	else
		SystemHelper.Log("[ cant find the item ]")

		return 0
	end
end

function FS_ItemList:GetItemNum(itemId)
	if self.itemList[itemId] ~= nil then
		return self.itemList[itemId]:GetNum()
	end

	return 0
end

function FS_ItemList:GetItem(itemId)
	if self.itemList[itemId] ~= nil then
		return self.itemList[itemId]
	else
		SystemHelper.Log("[ cant find the item -- " .. itemId .. " ]")
	end

	return nil
end

function FS_ItemList:GetTrophyCount()
	if self.trophyList then
		return table.nums(self.trophyList)
	end

	return 0
end

function FS_ItemList:GetItemListByType(type)
	local templist = {}

	if self.itemList then
		for k, v in pairs(self.itemList) do
			if v:GetMainType() == type and v:GetNum() > 0 then
				table.insert(templist, v)
			end
		end
	end

	table.sort(templist, function(a, b)
		return tonumber(a.itemId) < tonumber(b.itemId)
	end)

	return templist
end

function FS_ItemList:GetItemList()
	return self.itemList
end

function FS_ItemList:GetTrophyList()
	return self.trophyList
end

return FS_ItemList
