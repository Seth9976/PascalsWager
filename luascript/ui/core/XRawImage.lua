-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XRawImage.lua

XRawImage = class("XRawImage")

function XRawImage:initialize(object, x, y, total)
	if x == nil then
		x = 1
	end

	if y == nil then
		y = 1
	end

	if total == nil then
		total = x * y
	end

	self.gameObject = object
	self.transform = object.transform
	self.rImage = object:GetComponent("RawImage")
	self.currentIndex = 0
	self.cellNumX = x
	self.cellNumY = y
	self.total = total
	self.tween = nil
	self.startTime = 0
	self.duration = 1
end

function XRawImage:SetXY(x, y, total)
	self.cellNumX = x
	self.cellNumY = y
	self.total = total
end

function XRawImage:SetIndex(index)
	self.currentIndex = self.currentIndex % self.total

	local Row = Mathf.Floor(self.currentIndex / self.cellNumX)
	local Column = self.currentIndex % self.cellNumX
	local rectW = 1 / self.cellNumX
	local rectH = 1 / self.cellNumY
	local rectX = rectW * Column
	local rectY = 1 - (Row + 1) * rectH

	self.rImage.uvRect = UnityEngine.Rect.New(rectX, rectY, rectW, rectH)
end

function XRawImage:SetUvRect(rectX, rectY, rectW, rectH)
	self.rImage.uvRect = UnityEngine.Rect.New(rectX, rectY, rectW, rectH)
end

function XRawImage:Update()
	local now = TimeHelper.getNowTime()

	if now - self.startTime > self.duration then
		self.currentIndex = self.currentIndex + 1

		self:SetIndex(self.currentIndex)

		self.startTime = now
	end
end

return XRawImage
