-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/LoadProgressItem.lua

LoadProgressItem = class("LoadProgressItem")

function LoadProgressItem:initialize(name, children)
	self.itemName = name
	self.subItemList = children
	self.progress = 0
end

function LoadProgressItem:isHaveSubItem()
	if self.subItemList ~= nil and #self.subItemList > 0 then
		return true
	end

	return false
end

function LoadProgressItem:GetSubItemNameList()
	local ret = self:isHaveSubItem()

	if ret == true then
		local retList = {}

		for i = 1, #self.subItemList do
			local subItem = self.subItemList[i]

			table.insert(retList, subItem.subItemName)
		end

		return retList
	end

	return nil
end

function LoadProgressItem:GetSubItemList()
	local ret = self:isHaveSubItem()

	if ret == true then
		return self.subItemList
	end

	return nil
end

function LoadProgressItem:SetSubItemRequest(index, request, isFinish)
	local ret = self:isHaveSubItem()

	if ret == true then
		local subItem = self.subItemList[index]

		if subItem ~= nil then
			subItem:setRequest(request, isFinish)
		end
	end
end

function LoadProgressItem:setProgress(progress)
	self.progress = progress
end

function LoadProgressItem:getProgress()
	return self.progress
end

return LoadProgressItem
