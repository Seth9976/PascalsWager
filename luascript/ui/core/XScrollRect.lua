-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XScrollRect.lua

require("LuaScript/UI/Core/XObject")

XScrollRect = class("XScrollRect", XObject)

function XScrollRect:initialize(object)
	self.gameObject = object
	self.transform = object.transform
	self.scrollRectCom = self.transform:GetComponent("ScrollRect")

	if self.scrollRectCom == nil then
		SystemHelper.LogTest("节点" .. self.gameObject.name .. "没有ScrollRect组件")
	end

	self.scrollRectCom.scrollSensitivity = 16
end

function XScrollRect:Init()
	self:Register(EventTriggerType.Scroll)
end

function XScrollRect:Register(eventType)
	if EventTriggerType.Scroll then
		UILuaBehaviour.AddEvent(self.gameObject, EventTriggerType.Scroll, function(obj, data, param)
			self:OnScroll(obj, data, param)
		end, 0)
	end
end

function XScrollRect:OnScroll(obj, data, param)
	local scrollRect = self.scrollRectCom

	if not scrollRect:IsActive() then
		return
	end

	local delta = data.scrollDelta

	if scrollRect.vertical and not scrollRect.horizontal then
		if Mathf.Abs(delta.x) > Mathf.Abs(delta.y) then
			delta.y = delta.x
		end

		delta.x = 0
	end

	if scrollRect.horizontal and not scrollRect.vertical then
		if Mathf.Abs(delta.y) > Mathf.Abs(delta.x) then
			delta.x = delta.y
		end

		delta.y = 0
	end

	local position = scrollRect.content.anchoredPosition

	position = position - delta * scrollRect.scrollSensitivity
	scrollRect.content.anchoredPosition = position
end

return XScrollRect
