-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Vfx/VfxManager.lua

VfxManager = class("VfxManager")
VfxManager.static.useCache = true
VfxManager.staticIndex = 1

local vfxList, cacheList, template, staticList, vfxIndex, vfxRoot, vfxTemplateRoot, vfxInstanceRoot, vfxStaticRoot
local vfxShowEnable = true
local loadProgressStep, isUseLoadProgress, loadPrepareList, loadPreparePackageList, loadPackageCnt, loadedAssets
local this = VfxManager

function VfxManager.Init()
	vfxList = {}
	cacheList = {}
	template = {}
	staticList = {}
	vfxIndex = {}
end

function VfxManager.LoadStart(prepareList, loadStep, useProgress)
	VfxManager.staticIndex = 1
	loadPackageCnt = 0
	loadPackageList = {}
	loadedAssets = {}

	local tmpList = {}

	for k, v in pairs(prepareList) do
		v = string.lower(v)

		if tmpList[v] == nil then
			local name = "vfx/" .. v .. ".unity3d|" .. v .. ".prefab"

			table.insert(loadPackageList, name)

			tmpList[v] = 1
		else
			tmpList[v] = tmpList[v] + 1
		end
	end

	if #loadPackageList <= 0 then
		return false
	end

	loadProgressStep = loadStep
	isUseLoadProgress = useProgress

	for i = 1, #loadPackageList do
		local name = loadPackageList[i]
		local nameList = string.split(name, "|")
		local loadPackageName = nameList[1]
		local localAssets = {
			nameList[2]
		}

		if isUseLoadProgress == true then
			LoadProgress.CreateAndAddItem(loadProgressStep, loadPackageName, localAssets)
		end

		resMgr:LoadPrefabWithProgress(loadPackageName, localAssets, true, function(objs)
			if objs[0] ~= nil then
				local key = objs[0].name

				if loadedAssets[key] == nil then
					loadedAssets[key] = GoInstantiate(objs[0])

					loadedAssets[key].gameObject:SetActive(false)
				end
			end

			loadPackageCnt = loadPackageCnt + 1
		end, function(packageName, index, request, isFinish)
			if isUseLoadProgress == true then
				LoadProgress.SetSubItemRequest(loadProgressStep, packageName, index, request, isFinish)
			end
		end)
	end

	return true
end

function VfxManager.IsFinish()
	if loadPackageCnt >= #loadPackageList then
		VfxManager.LoadFinish()

		return true
	end

	return false
end

function VfxManager.FindRoot()
	if IsNil(vfxRoot) then
		vfxRoot = GoFind("VfxRoot")
		vfxTemplateRoot = vfxRoot.transform:Find("Vfx_Template")
		vfxInstanceRoot = vfxRoot.transform:Find("Vfx_Instance")
		vfxStaticRoot = vfxRoot.transform:Find("Vfx_Static")
	end
end

function VfxManager.EnableVfx(isEnabled)
	if vfxInstanceRoot ~= nil then
		vfxInstanceRoot.gameObject:SetActive(isEnabled)
	end

	vfxShowEnable = isEnabled
end

function VfxManager.LoadFinish()
	this.FindRoot()

	template = {}

	for _k, _v in pairs(loadedAssets) do
		local tfRoot = _v.transform
		local len = tfRoot.childCount

		for i = len - 1, 0, -1 do
			local tf = tfRoot:GetChild(i)

			tf:SetParent(vfxTemplateRoot.transform)

			tf.localPosition = Vector3.zero
			tf.localEulerAngles = Vector3.zero
			tf.localScale = Vector3.one

			tf.gameObject:SetActive(false)

			template[tf.name] = tf.gameObject
		end

		GoDestroy(tfRoot.gameObject)
	end

	loadedAssets = nil
end

function VfxManager.PlayStatic(vfxName, pos)
	if DebugDontShowEffect == true then
		return 0
	end

	if template[vfxName] == nil then
		SystemHelper.LogError("=======Play no effect:" .. vfxName)

		return 0
	end

	if staticList[VfxManager.staticIndex] ~= nil then
		return 0
	end

	local ret = VfxManager.staticIndex
	local key = vfxName .. "_copy_" .. VfxManager.staticIndex
	local obj = GoInstantiate(template[vfxName])
	local tf = obj.transform

	tf:SetParent(vfxStaticRoot)

	tf.name = key
	tf.position = pos

	obj:SetActive(true)

	staticList[ret] = tf
	VfxManager.staticIndex = VfxManager.staticIndex + 1

	return ret
end

function VfxManager.SetStaticPosition(index, pos)
	if staticList[index] == nil then
		return
	end

	staticList[index].position = pos
end

function VfxManager.ClearStatic(index)
	if staticList[index] == nil then
		return
	end

	GoDestroy(staticList[index].gameObject)

	staticList[index] = nil
end

function VfxManager.Play(hostGameTf, vfxName)
	if DebugDontShowEffect == true then
		return nil
	end

	local params = 1
	local key = vfxName .. "_copy_" .. params
	local vfx

	if vfxList[key] ~= nil then
		vfx = vfxList[key]
	end

	if vfx ~= nil then
		vfx:SetHost(hostGameTf)
		vfx:Play()

		return vfx
	end

	if VfxManager.useCache == true then
		if cacheList[key] ~= nil then
			vfx = cacheList[key]
		end

		if vfx ~= nil then
			vfx:SetHost(hostGameTf)
			vfx:Play()

			if vfxList[key] ~= nil then
				SystemHelper.LogError("========VfxManager=Play111==key=" .. key)
			else
				vfxList[key] = vfx
			end

			cacheList[key] = nil

			return vfx
		end
	end

	if template[vfxName] == nil then
		SystemHelper.LogError("=======Play no effect:" .. vfxName)

		return nil
	end

	local obj = GoInstantiate(template[vfxName])

	obj.transform:SetParent(vfxInstanceRoot)

	obj.name = key
	vfx = obj:AddComponent(typeof(XEffect))

	if vfx ~= nil then
		vfx:Init(false)
		vfx:SetHost(hostGameTf)
		vfx:Play()

		if vfxList[key] ~= nil then
			SystemHelper.LogError("========VfxManager=Play222==key=" .. key)
		else
			vfxList[key] = vfx
			vfxIndex[vfxName] = 1
		end
	end

	return vfx
end

function VfxManager.PlayMulti(hostGameTf, vfxName)
	if DebugDontShowEffect == true then
		return nil
	end

	local key = vfxName .. "_copy_"

	if VfxManager.useCache == true then
		for k, v in pairs(cacheList) do
			if StringHelper.StartsWith(k, key) then
				v:SetHost(hostGameTf)
				v:Play()

				if vfxList[k] ~= nil then
					SystemHelper.LogError("========VfxManager=PlayMulti111==k=" .. k)
				else
					vfxList[k] = v
				end

				cacheList[k] = nil

				return v
			end
		end
	end

	if template[vfxName] == nil then
		if hostGameTf == nil then
			SystemHelper.LogError("=======PlayMuti no effect:" .. vfxName .. ",hostGameTf=nil")
		else
			SystemHelper.LogError("=======PlayMuti no effect:" .. vfxName .. ",hostGameTf=" .. hostGameTf.name)
		end

		return nil
	end

	local params = this.GetEffectIndex(vfxName)

	key = key .. params

	local obj = GoInstantiate(template[vfxName])

	obj.transform:SetParent(vfxInstanceRoot)

	obj.name = key

	local vfx = obj:AddComponent(typeof(XEffect))

	if vfx ~= nil then
		vfx:Init(false)
		vfx:SetHost(hostGameTf)
		vfx:Play()

		if vfxList[key] ~= nil then
			SystemHelper.LogError("========VfxManager=PlayMulti222==key=" .. key)
		else
			vfxList[key] = vfx
		end
	end

	return vfx
end

function VfxManager.PlayBind(hostTf, vfxName)
	if DebugDontShowEffect == true then
		return nil
	end

	local vfx = this.Play(hostTf, vfxName)

	return vfx
end

function VfxManager.PlayFreeze(vfxName, pos, rot, scale)
	if DebugDontShowEffect == true then
		return nil
	end

	local vfx = this.Play(nil, vfxName)

	if vfx ~= nil then
		if rot == nil and scale == nil then
			vfx:SetTransform(pos)
		elseif scale == nil then
			vfx:SetTransform(pos, rot)
		else
			vfx:SetTransform(pos, rot, scale)
		end
	end

	return vfx
end

function VfxManager.PlayBindMulti(hostTf, vfxName)
	if DebugDontShowEffect == true then
		return nil
	end

	local vfx = this.PlayMulti(hostTf, vfxName)

	return vfx
end

function VfxManager.PlayFreezeMulti(vfxName, pos, rot, scale)
	if DebugDontShowEffect == true then
		return nil
	end

	local vfx = this.PlayMulti(nil, vfxName)

	if vfx ~= nil then
		if rot == nil and scale == nil then
			vfx:SetTransform(pos)
		elseif scale == nil then
			vfx:SetTransform(pos, rot)
		else
			vfx:SetTransform(pos, rot, scale)
		end
	end

	return vfx
end

function VfxManager.PlayTransformFreezeMulti(hostTf, vfxName)
	local vfx = this.PlayMulti(nil, vfxName)

	if vfx ~= nil and hostTf ~= nil then
		vfx:SetTransform(hostTf.position, hostTf.rotation, hostTf.localScale)
	end

	return vfx
end

function VfxManager.PlayBindVirtualPositionMulti(vfxName, pos, rot, scale)
	local virtualObject = VirtualGroup.CreateVirtualObject(vfxName)

	if virtualObject == nil then
		return nil, nil
	end

	virtualObject.position = pos
	virtualObject.rotation = rot
	virtualObject.localScale = scale

	local vfx = this.PlayMulti(virtualObject, vfxName)

	if vfx ~= nil then
		vfx:SetVirtualHost(true)
	end

	return vfx, virtualObject
end

function VfxManager.PlayDepend(parentTf, vfxName)
	if parentTf == nil then
		return nil
	end

	local vfxObj = template[vfxName]

	if vfxObj == nil then
		return nil
	elseif vfxObj.transform.parent ~= vfxTemplateRoot.transform then
		vfxObj = GoInstantiate(vfxObj)
	end

	vfxObj.transform:SetParent(parentTf)

	vfxObj.transform.localPosition = Vector3.zero
	vfxObj.transform.localEulerAngles = Vector3.zero
	vfxObj.transform.localScale = Vector3.one

	vfxObj:SetActive(true)

	return vfxObj
end

function VfxManager.GetEffectIndex(vfxName)
	if vfxIndex[vfxName] ~= nil then
		vfxIndex[vfxName] = vfxIndex[vfxName] + 1
	else
		vfxIndex[vfxName] = 1
	end

	return vfxIndex[vfxName]
end

function VfxManager.ClearCache()
	if VfxManager.useCache == true and cacheList ~= nil then
		for k, v in pairs(cacheList) do
			if v == nil then
				GoDestroyImmediate(v.gameObject)
			end
		end

		cacheList = {}
	end
end

function VfxManager.Clear()
	if vfxList ~= nil then
		for k, v in pairs(vfxList) do
			if v ~= nil then
				v:Clear()
				GoDestroy(v.gameObject)
			end
		end
	end

	vfxList = {}
	vfxCount = {}

	if staticList ~= nil then
		for k, v in pairs(staticList) do
			if v == nil then
				GoDestroy(v.gameObject)
			end
		end
	end

	staticList = {}

	if cacheList ~= nil then
		for k, v in pairs(cacheList) do
			if v == nil then
				GoDestroy(v.gameObject)
			end
		end
	end

	cacheList = {}
end

function VfxManager.Update()
	if vfxShowEnable == false then
		return
	end

	local deleteList

	for k, v in pairs(vfxList) do
		local isPlaying = v:IsPlaying()

		if isPlaying == false then
			if deleteList == nil then
				deleteList = {}
			end

			table.insert(deleteList, k)
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local k = deleteList[i]
			local v = vfxList[k]

			if v ~= nil then
				if VfxManager.useCache == true then
					if cacheList[k] ~= nil then
						SystemHelper.LogError("========VfxManager=Update==k=" .. k)
					else
						cacheList[k] = v
					end
				else
					GoDestroy(v.gameObject)
				end
			end

			vfxList[k] = nil
		end
	end

	deleteList = nil
end

return VfxManager
