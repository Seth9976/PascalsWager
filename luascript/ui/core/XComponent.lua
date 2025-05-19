-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XComponent.lua

XComponent = class("XComponent")

function XComponent:initialize(object)
	self.gameObject = object
	self.transform = object.transform
	self.children = {}
	self.groups = {}
	self.controllers = {}
	self.transitions = {}
	self.config = {}
	self.mainComponent = {}
	self.extension = {}
	self.textCom = {}
	self.loaderCom = {}
	self.imgGo = {}
end

function XComponent:InitComponent(config, configName, nodeName, adapted)
	if configName == nil then
		configName = "mainComponent"
	end

	self.config = config
	self.mainComponent = self.config[configName]

	for _k, _v in pairs(self.mainComponent) do
		if _v.type == "group" then
			local group = XGroup:new()

			group.groupId = _v.groupId

			group:SetMode(_v.groupMode)
			group:SetName(_v.groupName)

			self.groups[_v.groupId] = group
		end
	end

	for _k, _v in pairs(self.mainComponent) do
		if _v.type == "prefab" then
			self.children[_v.exportName] = {}
			self.children[_v.exportName].gameObject = self.gameObject

			self:ApplyComponents(self.gameObject, _v, nodeName)
		elseif _v.type == "gameObject" then
			self.children[_v.exportName] = {}

			local childTf = self.gameObject.transform:Find(_v.path)

			if childTf == nil then
				SystemHelper.LogTest(self.gameObject.name .. "##########" .. _v.exportName .. "节点未找到,路径为" .. _v.path)
			end

			if childTf then
				local childObj = childTf.gameObject

				self.children[_v.exportName].gameObject = childObj

				self:ApplyComponents(childObj, _v, nodeName)

				if _v.groupId > 0 then
					local group = self.groups[_v.groupId]

					if group.mode == XGroup.GroupMode.Common then
						group:Add(childObj)
					elseif group.mode == XGroup.GroupMode.Button then
						group:Add(self.children[_v.exportName].button)
					end
				end
			end
		end
	end

	if UIManager.IsSteamDeck() then
		local canvasScaler = self.gameObject:GetComponent("CanvasScaler")

		if canvasScaler then
			canvasScaler.referenceResolution = Vector2.New(1334, 750)
		end
	end

	if adapted == nil or not adapted then
		for _k, _v in pairs(self.mainComponent) do
			if _v.type == "gameObject" then
				local subs = string.split(_v.exportName, "_")

				self:AutoAdaption(self.children[_v.exportName].gameObject, subs[#subs])
			end
		end
	end

	local showJoystickIcons = false
	local showKeyboardIcons = false

	if UIManager.GetLastInputDevice() == UIManager.InputDevice.Joystick then
		showJoystickIcons = true
		showKeyboardIcons = false
	else
		showJoystickIcons = false
		showKeyboardIcons = true
	end

	self.joystickGroup = self:GetGroupByName("JoystickIcon")

	if self.joystickGroup then
		self.joystickGroup:SetRectTransform()
		self.joystickGroup:SetActive(showJoystickIcons)
		self:RefreshJoystickIcon(LS_Setting.platform)
	end

	self.keyboardGroup = self:GetGroupByName("KeyboardIcon")

	if self.keyboardGroup then
		self.keyboardGroup:SetRectTransform()
		self.keyboardGroup:SetActive(showKeyboardIcons)
	end
end

function XComponent:Revalidate(isJoystickAttached, isKeyboardAttached)
	if self.joystickGroup then
		self.joystickGroup:SetActive(isJoystickAttached)
		self.joystickGroup:ForceRebuildLayout(isJoystickAttached)
	end

	if self.keyboardGroup then
		self.keyboardGroup:SetActive(isKeyboardAttached)
		self.keyboardGroup:ForceRebuildLayout(isKeyboardAttached)
	end

	for k, v in pairs(self.loaderCom) do
		for _k, _v in pairs(v.children) do
			_v:Revalidate(isJoystickAttached, isKeyboardAttached)
		end
	end
end

function XComponent:RefreshText(font)
	for k, v in pairs(self.textCom) do
		local defaultTextArr = string.split(k, ".")

		if v:GetChangeable() then
			if v:IsGameText() then
				v:SetGameTextContent(v.gameTextfunc)
			end
		else
			v:SetRawContent(GameTextAuto[defaultTextArr[1]][defaultTextArr[2]])
		end

		if font then
			v:SetFont(font)
		end
	end

	for k, v in pairs(self.loaderCom) do
		for _k, _v in pairs(v.children) do
			_v:RefreshText(font)
		end
	end

	local suffix = LS_Setting.GetLanguage()

	for k, v in pairs(self.imgGo) do
		local _sprite = XObjectPool.GetIcon(k .. "_" .. suffix)

		if _sprite then
			v:GetComponent("Image").sprite = _sprite
		end
	end
end

function XComponent:RefreshJoystickIcon(platform)
	local group = self.joystickGroup

	if group and table.nums(group.children) > 0 then
		for k, v in pairs(group.children) do
			if v ~= nil and not IsNil(v) then
				local subs = string.split(v.name, "_")

				if #subs == 3 then
					local suffix = string.lower(subs[3])

					if LS_Setting.exBtnIco1 then
						if suffix == "a" then
							suffix = "b"
						elseif suffix == "b" then
							suffix = "a"
						end
					end

					if LS_Setting.exBtnIco2 then
						if suffix == "x" then
							suffix = "y"
						elseif suffix == "y" then
							suffix = "x"
						end
					end

					local sprite = XObjectPool.GetIcon(platform .. "_" .. suffix)

					if sprite then
						v:GetComponent("Image").sprite = sprite
					end
				end
			end
		end
	end

	for k, v in pairs(self.loaderCom) do
		for _k, _v in pairs(v.children) do
			_v:RefreshJoystickIcon(platform)
		end
	end
end

function XComponent:RefreshKeyboardIcon(platform)
	local group = self.keyboardGroup

	if group and table.nums(group.children) > 0 then
		for k, v in pairs(group.children) do
			if v ~= nil and not IsNil(v) then
				SystemHelper.Log("________KeyboardIcon: " .. v.name)

				local subs = string.split(v.name, "_")

				if #subs == 3 then
					local suffix = string.lower(subs[3])
					local sprite = XObjectPool.GetIcon(platform .. "_" .. suffix)

					if sprite then
						v:GetComponent("Image").sprite = sprite
					end
				end
			end
		end
	end

	for k, v in pairs(self.loaderCom) do
		for _k, _v in pairs(v.children) do
			_v:RefreshKeyboardIcon(platform)
		end
	end
end

function XComponent:AddImage(go, name)
	if table.contains(self.imgGo, go) then
		for _k, _v in pairs(self.imgGo) do
			if _v == go then
				self.imgGo[_k] = nil
			end
		end
	end

	local suffix = LS_Setting.GetLanguage()
	local _sprite = XObjectPool.GetIcon(name .. "_" .. suffix)

	if _sprite ~= nil then
		go:GetComponent("Image").sprite = _sprite
	end

	self.imgGo[name] = go
end

function XComponent:ApplyComponents(childObj, objectInfo, nodeName)
	if objectInfo.components == nil then
		return
	end

	for _k, _v in pairs(objectInfo.components) do
		local component = self.mainComponent[_v]

		if component.type == "button" then
			local btn = XButton:new(childObj)

			btn:SetMode(component.mode)
			self:SetButton(objectInfo.exportName, btn, component.events)

			self.children[objectInfo.exportName].button = btn
		elseif component.type == "text" then
			local text = XText:new(childObj)
			local defaultTextArr = string.split(component.text, ".")

			if #defaultTextArr == 2 then
				text:SetRawContent(GameTextAuto[defaultTextArr[1]][defaultTextArr[2]])

				self.textCom[component.text] = text
			end

			self.children[objectInfo.exportName].text = text
		elseif component.type == "loader" then
			local loader = XLoader:new(childObj)

			for _rk, _rv in pairs(component.res) do
				loader:AddTemplate(self.config, nodeName, _rv.assetName)
			end

			self.children[objectInfo.exportName].loader = loader

			table.insert(self.loaderCom, loader)
		end
	end
end

function XComponent:AutoAdaption(com, align)
	if com ~= nil and align ~= nil then
		local margin = 48
		local screenRatio = SystemHelper.GetScreenWidth() / SystemHelper.GetScreenHeight()

		if screenRatio >= 2.16 and screenRatio <= 2.18 then
			if align == "L" then
				local pos = com.transform.localPosition

				pos.x = pos.x + margin
				com.transform.localPosition = pos
			elseif align == "R" then
				local pos = com.transform.localPosition

				pos.x = pos.x - margin
				com.transform.localPosition = pos
			elseif align == "B" then
				local pos = com.transform.localPosition

				pos.y = pos.y + margin
				com.transform.localPosition = pos
			elseif align == "LB" then
				local pos = com.transform.localPosition

				pos.x = pos.x + margin
				pos.y = pos.y + margin
				com.transform.localPosition = pos
			elseif align == "RB" then
				local pos = com.transform.localPosition

				pos.x = pos.x - margin
				pos.y = pos.y + margin
				com.transform.localPosition = pos
			end
		elseif screenRatio >= 2.16 then
			margin = 96

			if align == "L" or align == "LB" then
				local pos = com.transform.localPosition

				pos.x = pos.x + margin
				com.transform.localPosition = pos
			elseif align == "R" or align == "RB" then
				local pos = com.transform.localPosition

				pos.x = pos.x - margin
				com.transform.localPosition = pos
			end
		elseif screenRatio > 1.8 then
			if align == "L" or align == "LB" then
				local pos = com.transform.localPosition

				pos.x = pos.x + margin
				com.transform.localPosition = pos
			elseif align == "R" or align == "RB" then
				local pos = com.transform.localPosition

				pos.x = pos.x - margin
				com.transform.localPosition = pos
			end
		end
	end
end

function XComponent:SetButton(exportName, btn, eventType)
	if eventType == nil then
		return
	end
end

function XComponent:GetComponents(childName, type)
	if type == "gameObject" then
		return self:GetGameObject(childName)
	elseif type == "button" then
		return self:GetButton(childName)
	elseif type == "text" then
		return self:GetText(childName)
	elseif type == "loader" then
		return self:GetLoader(childName)
	end
end

function XComponent:GetButton(childName)
	if self.children[childName] == nil then
		return
	end

	return self.children[childName].button
end

function XComponent:GetGameObject(childName)
	if self.children[childName] == nil then
		return
	end

	return self.children[childName].gameObject
end

function XComponent:GetText(childName)
	if self.children[childName] == nil then
		return
	end

	return self.children[childName].text
end

function XComponent:GetLoader(childName)
	if self.children[childName] == nil then
		return
	end

	return self.children[childName].loader
end

function XComponent:GetGroupById(groupId)
	return self.groups[groupId]
end

function XComponent:GetGroupByName(groupName)
	for _k, _v in pairs(self.groups) do
		if _v.name == groupName then
			return _v
		end
	end

	return nil
end

function XComponent:GetGroupByPrefix(prefix)
	local tbl = {}
	local len = string.len(prefix)

	for _k, _v in pairs(self.groups) do
		if string.sub(_v.name, 1, len) == prefix then
			table.insert(tbl, _v)
		end
	end

	return tbl
end

function XComponent:GetAbAndAssetName(configData)
	local abName = ""
	local assetName = ""

	for _k, _v in pairs(configData) do
		if _v.type == "prefab" then
			abName = _v.abName
			assetName = _v.assetName

			break
		end
	end

	return abName, assetName
end

function XComponent:ClearAllLoaderChild()
	for k, v in pairs(self.loaderCom) do
		v:ClearChild()
	end
end

function XComponent:ReturnToPool()
	if IsNil(self.gameObject) == false then
		local abName, assetName = self:GetAbAndAssetName(self.mainComponent)

		XObjectPool.ReturnToPool(abName, assetName, self.gameObject)
	end

	self.gameObject = nil
	self.transform = nil
end

return XComponent
