-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XLoader.lua

XLoader = class("XLoader", XComponent)

function XLoader:initialize(object)
	self.gameObject = object
	self.transform = object.transform
	self.templateTable = {}
	self.newChildIndexStart = 1
	self.loadCount = 1
	self.prepareCount = 0
	self.clearContentOnLoad = true
	self.reuseCom = false
	self.deactiveList = {}
	self.loadFinish = true
	self.children = {}

	function self.assetIndexFunc(childIndex)
		return 1
	end

	function self.loadCallback(index, com, data)
		return
	end
end

function XLoader:AddTemplate(config, abName, assetName)
	self.config = config

	table.insert(self.templateTable, {
		abName = abName,
		assetName = assetName
	})
end

function XLoader:PreloadTemplate(callback)
	local templateCount = 0

	for _k, _v in pairs(self.templateTable) do
		local abName = _v.abName
		local assetName = _v.assetName
		local pool = XObjectPool.GetPool(abName, assetName)

		if pool ~= nil and table.nums(pool) > 0 then
			templateCount = templateCount + 1

			if templateCount == #self.templateTable and callback ~= nil then
				callback()
			end
		else
			XObjectPool.CreatePool(abName, assetName, 1, function()
				templateCount = templateCount + 1

				if templateCount == #self.templateTable and callback ~= nil then
					callback()
				end
			end)
		end
	end
end

function XLoader:ClearTemplate()
	for _k, _v in pairs(self.templateTable) do
		local abName = _v.abName
		local assetName = _v.assetName

		XObjectPool.ClearPool(abName, assetName)
	end
end

function XLoader:SetCacheNumMax(index, num)
	local cacheTemplate = self.templateTable[index]

	XObjectPool.SetNumMax(cacheTemplate.abName, cacheTemplate.assetName, num)
end

function XLoader:GetTemplateIndex(abName, assetName)
	for _k, _v in pairs(self.templateTable) do
		if _v.abName == abName and _v.assetName == assetName then
			return _k
		end
	end

	return 1
end

function XLoader:SetReuseCom(val)
	self.reuseCom = val

	if val then
		self.clearContentOnLoad = true
	end
end

function XLoader:SetCount(count)
	if count == nil then
		count = 1
	end

	self.loadCount = count
end

function XLoader:GetStep()
	local count = self.loadCount - self.prepareCount

	return count
end

function XLoader:IsLoaded()
	if self.loadCount > 0 and self.prepareCount == 0 then
		return true
	end

	return false
end

function XLoader:GetChild(index)
	return self.children[index]
end

function XLoader:RemoveChild(child)
	for i = 1, #self.children do
		if self.children[i] == child then
			table.remove(self.children, i)

			break
		end
	end
end

function XLoader:RemoveChildAt(index)
	self.children[index] = nil
end

function XLoader:ClearChild()
	if self.reuseCom then
		for _k, _v in pairs(self.children) do
			if not table.contains(self.deactiveList, _v) then
				table.insert(self.deactiveList, _v)
			end

			_v.gameObject:SetActive(false)
		end

		self.children = {}
	else
		for _k, _v in pairs(self.children) do
			_v:ReturnToPool()
		end

		self.children = {}
	end
end

function XLoader:Load(dataTbl)
	if self.loadFinish == false then
		return
	end

	if self.clearContentOnLoad then
		self:ClearChild()
	end

	self.newChildIndexStart = #self.children + self.prepareCount + 1
	self.prepareCount = self.prepareCount + self.loadCount

	local prefabIndex = 1

	if self.newChildIndexStart + self.loadCount > self.newChildIndexStart then
		self.loadFinish = false
	end

	if self.reuseCom and self.loadCount <= #self.deactiveList then
		for i = self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1 do
			self.prepareCount = self.prepareCount - 1

			local com = self.deactiveList[i]

			com.gameObject:SetActive(true)
			table.insert(self.children, com)
			self.loadCallback(i, com, dataTbl)
		end

		self.loadFinish = true

		return self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1
	else
		for _k, _v in pairs(self.deactiveList) do
			_v:ReturnToPool()
		end

		self.deactiveList = {}

		for i = self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1 do
			local childIndex = i

			if dataTbl ~= nil and dataTbl.prefabIndex ~= nil then
				prefabIndex = dataTbl.prefabIndex
			elseif self.assetIndexFunc ~= nil then
				prefabIndex = self.assetIndexFunc(childIndex)
			end

			local abName = self.templateTable[prefabIndex].abName
			local assetName = self.templateTable[prefabIndex].assetName

			XObjectPool.GetFromPool(abName, assetName, function(obj)
				self.prepareCount = self.prepareCount - 1

				self:InitComponent(childIndex, obj, dataTbl)

				if i == self.newChildIndexStart + self.loadCount - 1 then
					self.loadFinish = true
				end
			end)
		end

		return self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1
	end
end

function XLoader:RecycleAll()
	for _k, _v in pairs(self.deactiveList) do
		_v:ReturnToPool()
	end

	for _k, _v in pairs(self.children) do
		_v:ReturnToPool()
	end

	self.deactiveList = {}
	self.children = {}
end

function XLoader:LoadIndividuals(dataTbl)
	if self.loadFinish == false then
		return
	end

	if self.clearContentOnLoad then
		self:ClearChild()
	end

	self.newChildIndexStart = #self.children + self.prepareCount + 1
	self.prepareCount = self.prepareCount + self.loadCount

	local prefabIndex = 1

	if self.newChildIndexStart + self.loadCount > self.newChildIndexStart then
		self.loadFinish = false
	end

	for i = self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1 do
		local childIndex = i
		local typeIndex = i - self.newChildIndexStart + 1

		if dataTbl ~= nil and dataTbl[typeIndex] ~= nil and dataTbl[typeIndex].prefabIndex ~= nil then
			prefabIndex = dataTbl[typeIndex].prefabIndex
		elseif self.assetIndexFunc ~= nil then
			prefabIndex = self.assetIndexFunc(childIndex)
		end

		local abName = self.templateTable[prefabIndex].abName
		local assetName = self.templateTable[prefabIndex].assetName

		XObjectPool.GetFromPool(abName, assetName, function(obj)
			self.prepareCount = self.prepareCount - 1

			local data

			if dataTbl ~= nil and dataTbl[typeIndex] ~= nil then
				data = dataTbl[typeIndex]
			end

			self:InitComponent(childIndex, obj, data)

			if i == self.newChildIndexStart + self.loadCount - 1 then
				self.loadFinish = true
			end
		end)
	end

	return self.newChildIndexStart, self.newChildIndexStart + self.loadCount - 1
end

function XLoader:InitComponent(childIndex, obj, dataTbl)
	local prefabIndex = 1

	if dataTbl ~= nil and dataTbl.prefabIndex ~= nil then
		prefabIndex = dataTbl.prefabIndex
	elseif self.assetIndexFunc ~= nil then
		prefabIndex = self.assetIndexFunc(childIndex)
	end

	local abName = self.templateTable[prefabIndex].abName
	local assetName = self.templateTable[prefabIndex].assetName

	obj.name = abName .. "_" .. assetName .. "_" .. tostring(childIndex)

	local parent = self.gameObject.transform

	obj.transform:SetParent(parent)

	obj.transform.localPosition = Vector3.zero
	obj.transform.localEulerAngles = Vector3.zero
	obj.transform.localScale = Vector3.one

	obj:SetActive(true)

	local com = XComponent:new(obj)

	com:InitComponent(self.config, assetName)
	table.insert(self.children, com)
	self.loadCallback(childIndex, com, dataTbl)
end

function XLoader:GetAbAndAssetName(configData)
	return XComponent.GetAbAndAssetName(self, configData)
end

return XLoader
