-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XText.lua

XText = class("XText")

function XText:initialize(object, default)
	self.gameObject = object
	self.transform = object.transform
	self.content = ""
	self.textCom = self.transform:GetComponent("Text")

	if self.textCom == nil then
		SystemHelper.LogTest("节点" .. self.gameObject.name .. "没有text组件")
	end

	self.changeable = false
	self.gameTextfunc = nil

	self:SetRawContent(default)
end

function XText:GetContent()
	if self.textCom then
		return self.textCom.text
	end

	return ""
end

function XText:SetContent(content)
	self.content = content

	if self.textCom ~= nil then
		self.textCom.text = content
		self.changeable = true
	end
end

function XText:SetRawContent(content)
	self.content = content

	if IsNil(self.textCom) == false then
		self.textCom.text = content
	end
end

function XText:SetGameTextContent(luafunc)
	local st = ""

	self.gameTextfunc = luafunc

	if self.gameTextfunc ~= nil then
		st = self.gameTextfunc()
	end

	self.changeable = true

	if self.textCom ~= nil then
		self.textCom.text = st
	end
end

function XText:GetChangeable()
	return self.changeable
end

function XText:IsGameText()
	return self.gameTextfunc ~= nil
end

function XText:SetColor(r, g, b, a)
	if self.textCom ~= nil then
		self.textCom.color = Color.New(r, g, b, a)
	end
end

function XText:SetFontSize(num)
	if self.textCom ~= nil then
		return self.textCom.fontSize
	end

	return 20
end

function XText:SetFontSize(num)
	if IsNil(self.textCom) == false then
		self.textCom.fontSize = num
	end
end

function XText:SetAlignment(textAnchor)
	if self.textCom ~= nil then
		self.textCom.alignment = textAnchor
	end
end

function XText:SetContentAnimCustom(newContent, interval, times)
	if type(self.content) ~= "number" or type(newContent) ~= "number" then
		SystemHelper.LogError("xtext content is not a number!")

		return
	end

	if IsNil(self.gameObject) then
		return
	end

	local delta = newContent - self.content

	if delta == 0 then
		return
	end

	if self.textAnimTimer ~= nil then
		self.textAnimTimer:Stop()
	end

	local totalTimes

	if times < Mathf.Abs(delta) then
		totalTimes = times
	else
		totalTimes = Mathf.Abs(delta)
	end

	local firstDelta = Mathf.Abs(delta) % totalTimes

	if delta > 0 then
		self.content = self.content + Mathf.Abs(firstDelta)
	else
		self.content = self.content - Mathf.Abs(firstDelta)
	end

	self.textCom.text = self.content

	if delta > 0 then
		delta = Mathf.Floor(delta / totalTimes)
	else
		delta = Mathf.Ceil(delta / totalTimes)
	end

	if self.textAnimTimer == nil then
		self.textAnimTimer = Timer.New(function()
			if not IsNil(self.gameObject) then
				self.content = self.content + delta
				self.textCom.text = Mathf.Floor(self.content)
			end
		end, interval, totalTimes, true)
	else
		self.textAnimTimer:Reset(function()
			if not IsNil(self.gameObject) then
				self.content = self.content + delta
				self.textCom.text = Mathf.Floor(self.content)
			end
		end, interval, totalTimes, true)
	end

	self.textAnimTimer:Start()
end

function XText:SetContentAnim(newContent)
	if type(self.content) ~= "number" or type(newContent) ~= "number" then
		SystemHelper.LogError("xtext content is not a number!")

		return
	end

	local delta = newContent - self.content

	if delta == 0 then
		return
	end

	if self.textAnimTimer ~= nil then
		self.textAnimTimer:Stop()
	end

	local totalTimes

	totalTimes = Mathf.Abs(delta) > 10 and 10 or Mathf.Abs(delta)

	local firstDelta = Mathf.Abs(delta) % totalTimes

	if delta > 0 then
		self.content = self.content + Mathf.Abs(firstDelta)
	else
		self.content = self.content - Mathf.Abs(firstDelta)
	end

	self.textCom.text = self.content

	if delta > 0 then
		delta = Mathf.Floor(delta / totalTimes)
	else
		delta = Mathf.Ceil(delta / totalTimes)
	end

	if self.textAnimTimer == nil then
		self.textAnimTimer = Timer.New(function()
			self.content = self.content + delta
			self.textCom.text = self.content
		end, 0.1, totalTimes, true)
	else
		self.textAnimTimer:Reset(function()
			self.content = self.content + delta
			self.textCom.text = self.content
		end, 0.1, totalTimes, true)
	end

	self.textAnimTimer:Start()
end

function XText:SetFont(font)
	if not IsNil(self.gameObject) and (not self.textCom.font or true) then
		self.textCom.font = font
	end
end

return XText
