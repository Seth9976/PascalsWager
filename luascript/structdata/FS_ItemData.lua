-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ItemData.lua

FS_ItemData = class("FS_ItemData")

function FS_ItemData:initialize(id, num, isNew)
	self.itemId = id
	self.itemData = MS_ItemData.GetItemData(id)
	self.itemName = self.itemData.Name
	self.itemMainType = tonumber(self.itemData.MainType)
	self.itemType = tonumber(self.itemData.Type)
	self.itemNumMax = tonumber(self.itemData.NumMax)
	self.itemNum = num
	self.itemIcon = self.itemData.Icon
	self.itemLink = 0
	self.isNew = isNew
end

function FS_ItemData:Clear()
	self.itemData = nil
end

function FS_ItemData:GetMainType()
	return self.itemMainType
end

function FS_ItemData:GetType()
	return self.itemType
end

function FS_ItemData:GetItemData()
	return self.itemData
end

function FS_ItemData:IsNew()
	if self.isNew then
		return true
	else
		return false
	end
end

function FS_ItemData:SetOld()
	self.isNew = false
end

function FS_ItemData:GetEmotionType()
	if self.itemData.EmotionType ~= nil then
		return self.itemData.EmotionType
	end

	return 0
end

function FS_ItemData:GetItemName()
	self.itemName = self.itemData.Name

	return self.itemName
end

function FS_ItemData:GetItemId()
	return self.itemId
end

function FS_ItemData:AddNum(num)
	local oldNum = self.itemNum

	self.itemNum = self.itemNum + num

	return self.itemNum - oldNum
end

function FS_ItemData:SubNum(num)
	local oldNum = self.itemNum

	self.itemNum = self.itemNum - num

	return oldNum - self.itemNum
end

function FS_ItemData:GetNum()
	return self.itemNum
end

function FS_ItemData:GetCanBless()
	return self.itemData.IsBless > 0
end

function FS_ItemData:GetNumMax()
	return self.itemNumMax
end

function FS_ItemData:UseItem(num)
	if num > 0 then
		return self:SubNum(num)
	end

	return 0
end

function FS_ItemData:Exit()
	if self.effect ~= nil then
		self.effect:Clear()

		self.effect = nil
	end
end

return FS_ItemData
