-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/LoadProgressSubItem.lua

LoadProgressSubItem = class("LoadProgressSubItem")

function LoadProgressSubItem:initialize(name)
	self.subItemName = name
	self.progress = 0
	self.request = nil
	self.finish = false
end

function LoadProgressSubItem:setProgress(progress)
	self.progress = progress
end

function LoadProgressSubItem:setRequest(request, isFinish)
	if isFinish == false then
		self.request = request
	else
		self:loadFinish()
	end
end

function LoadProgressSubItem:getProgress()
	if self.finish == true then
		return 100
	else
		if self.request ~= nil then
			self.progress = Mathf.Floor(self.request.progress * 100)
		end

		return self.progress
	end
end

function LoadProgressSubItem:loadFinish()
	self.request = nil
	self.finish = true
	self.progress = 100
end

return LoadProgressSubItem
