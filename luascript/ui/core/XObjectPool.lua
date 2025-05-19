-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XObjectPool.lua

XObjectPool = class("XObjectPool", XComponent)

local poolRootObject
local objectPool = {}
local objectMaxTbl = {}
local iconTbl = {}
local iconBackup = {}
local UrlIconTbl = {}
local loadPackageMax = 0
local loadPackageCnt = 0
local singleImage, assetName, managedImages
local shaderPool = {}
local iconPackageList = {
	"icon/achievement",
	"icon/actionbutton",
	"icon/gamepad",
	"icon/heroicon",
	"icon/heroportrait",
	"icon/item",
	"icon/photo",
	"icon/skill",
	"icon/status",
	"icon/talent",
	"icon/taskTitle",
	"icon/wearSelection",
	"icon/arcadePortrait",
	"icon/other",
	"icon/keyBoard"
}

function XObjectPool.CreatePool(abName, assetName, initNum, callback)
	if initNum == nil then
		initNum = 1
	end

	if not DebugLoadPrefab then
		XObjectPool.Load(abName, assetName, true, function(obj)
			if obj == nil then
				SystemHelper.LogError("Not found !!! abName: " .. abName .. ", assetName: " .. assetName .. "!!")
			end

			local pool = XObjectPool.GetPool(abName, assetName)

			for i = 1, initNum do
				local go = XObjectPool.Instantiate(obj, true)

				table.insert(pool, go)
			end

			if callback ~= nil then
				callback()
			end
		end)
	else
		XObjectPool.Load(abName, assetName, true, function(objs)
			print_r(objs)

			if objs[0] == nil then
				SystemHelper.LogError("Not found !!! abName: " .. abName .. ", assetName: " .. assetName .. "!!")
			end

			local pool = XObjectPool.GetPool(abName, assetName)

			for i = 1, initNum do
				local go = XObjectPool.Instantiate(objs[0], true)

				table.insert(pool, go)
			end

			if callback ~= nil then
				callback()
			end
		end)
	end
end

function XObjectPool.LoadIcon(callback)
	iconTbl = {}
	loadPackageCnt = 0
	loadPackageMax = #iconPackageList

	for k, loadPackageName in pairs(iconPackageList) do
		SystemHelper.LogTest("============loadPackageName==" .. loadPackageName)
		resMgr:LoadPrefabWithProgress(loadPackageName, {
			"all"
		}, false, function(objs)
			SystemHelper.LogTest("============loadPackageName==" .. loadPackageName .. ",objs.Length = " .. objs.Length)

			for i = 0, objs.Length - 1 do
				if objs[i] == nil then
					SystemHelper.LogError("Not found !!! packageName:" .. loadPackageName .. ",objs[i]=null ! i =" .. i)
				end

				local key = StringHelper.GetFileNameWithoutExtension(objs[i].name)

				if iconTbl[key] == nil and objs[i] ~= nil then
					iconTbl[key] = objs[i]
				end
			end

			loadPackageCnt = loadPackageCnt + 1

			if loadPackageCnt == loadPackageMax and callback ~= nil then
				callback()
			end
		end, function(packageName, index, request, isFinish)
			return
		end)
	end
end

function XObjectPool.LoadImage(name, callback)
	local package = name .. ".unity3d"
	local assets = {
		name .. ".png"
	}

	if name ~= assetName then
		assetName = name
	end

	resMgr:LoadPrefabWithProgress(package, assets, true, function(objs)
		if objs[0] ~= nil then
			if singleImage ~= nil then
				GoDestroyImmediate(singleImage)

				singleImage = nil
			end

			singleImage = objs[0]
		end

		if callback ~= nil then
			callback()
		end
	end, function(packageName, index, request, isFinish)
		return
	end)
end

function XObjectPool.GetImage(name, callback)
	return singleImage
end

function XObjectPool.ClearImage()
	assetName = nil

	if singleImage ~= nil then
		GoDestroyImmediate(singleImage)

		singleImage = nil
	end
end

function XObjectPool.LoadManagedImage(idx, name, callback)
	local package = string.format("%s.unity3d", name)
	local assets = {
		string.format("%s.png", name)
	}

	if managedImages == nil then
		managedImages = {}
	end

	resMgr:LoadPrefabWithProgress(package, assets, true, function(objs)
		if objs[0] ~= nil then
			if managedImages[idx] ~= nil then
				GoDestroyImmediate(managedImages[idx])

				managedImages[idx] = nil
			end

			managedImages[idx] = objs[0]
		end

		if callback ~= nil then
			callback()
		end
	end, function(packageName, index, request, isFinish)
		return
	end)
end

function XObjectPool.GetManagedImage(idx)
	if managedImages ~= nil and managedImages[idx] ~= nil then
		return managedImages[idx]
	end

	return nil
end

function XObjectPool.ClearManagedImage(idx)
	if managedImages ~= nil and managedImages[idx] ~= nil then
		GoDestroyImmediate(managedImages[idx])

		managedImages[idx] = nil
	end
end

function XObjectPool.ClearAllManagedImages()
	if managedImages ~= nil then
		for _k, _v in pairs(managedImages) do
			if _v ~= nil then
				GoDestroyImmediate(_v)
			end
		end

		managedImages = nil
	end
end

function XObjectPool.IsLoadedIcon()
	if iconTbl ~= nil and next(iconTbl) ~= nil then
		return true
	end

	return false
end

function XObjectPool.GetIcon(key)
	if iconTbl[key] ~= nil then
		return iconTbl[key]
	end

	if iconBackup[key] ~= nil then
		return iconBackup[key]
	end

	return nil
end

function XObjectPool.LoadShader(packageName, callback)
	shaderPool = {}

	Common.EnableShaderKeyword("LIGHTMAP_ON")
	Common.EnableShaderKeyword("DIRLIGHTMAP_COMBINED")
	Common.EnableShaderKeyword("LIGHTMAP_SHADOW_MIXING")
	resMgr:LoadPrefabWithProgress(packageName, {
		"all"
	}, false, function(objs)
		for i = 0, objs.Length - 1 do
			if objs[i] == nil then
				SystemHelper.LogError("Not found !!! packageName:" .. loadPackageName .. ":::" .. loadAssets[i + 1] .. "中的图片")
			end

			local key = StringHelper.GetFileNameWithoutExtension(objs[i].name)

			if shaderPool[key] == nil and objs[i] ~= nil then
				shaderPool[key] = objs[i]

				if key == "ShaderVariants" then
					shaderPool[key]:WarmUp()
				elseif key == "fangsong" then
					SystemHelper.LogTest("key=" .. key)
				end
			end
		end

		if callback ~= nil then
			callback()
		end
	end, function(packageName, index, request, isFinish)
		return
	end)
end

function XObjectPool.GetShader(shaderName)
	if shaderPool ~= nil and shaderPool[shaderName] ~= nil then
		return shaderPool[shaderName]
	end

	return nil
end

function XObjectPool.Load(abName, assetName, needUnload, callback)
	if not DebugLoadPrefab then
		if callback ~= nil then
			callback(ST_Base.GetUi(abName, assetName))
		end
	else
		resMgr:LoadPrefab(abName, {
			assetName
		}, needUnload, function(objs)
			if callback ~= nil then
				callback(objs)
			end
		end)
	end
end

function XObjectPool.GetPoolRootObject()
	if poolRootObject == nil or IsNil(poolRootObject) then
		poolRootObject = GoCreate("XObjectPool")

		UnityEngine.Object.DontDestroyOnLoad(poolRootObject)

		poolRootObject.transform.localScale = Vector3.one
		poolRootObject.transform.localPosition = Vector3.zero
		poolRootObject.transform.localEulerAngles = Vector3.one
	end

	return poolRootObject
end

function XObjectPool.ReturnToPool(abName, assetName, go)
	local max = XObjectPool.GetNumMax(abName, assetName)
	local pool = XObjectPool.GetPool(abName, assetName)

	if pool == nil or max <= #pool then
		GoDestroy(go.gameObject)
	else
		go.name = assetName

		XObjectPool.GetPoolRootObject()
		go.transform:SetParent(poolRootObject.transform)
		go:SetActive(false)
		table.insert(pool, go)
	end
end

function XObjectPool.GetPool(abName, assetName)
	if objectPool[abName] == nil then
		objectPool[abName] = {}
	end

	if objectPool[abName][assetName] == nil then
		objectPool[abName][assetName] = {}
	end

	return objectPool[abName][assetName]
end

function XObjectPool.ClearPool(abName, assetName)
	local pool = XObjectPool.GetPool(abName, assetName)

	for _k, _v in pairs(pool) do
		GoDestroy(_v)
	end

	objectPool[abName][assetName] = {}
end

function XObjectPool.GetFromPool(abName, assetName, callback)
	if callback == nil then
		SystemHelper.LogTest("callback function cannot be null !!!")
	end

	local pool = XObjectPool.GetPool(abName, assetName)
	local go

	if pool == nil or #pool == 0 then
		if not DebugLoadPrefab then
			XObjectPool.Load(abName, assetName, true, function(obj)
				if obj == nil then
					SystemHelper.LogError(string.format("[ Not found !!! %s - %s ]", abName, assetName))
				end

				go = XObjectPool.Instantiate(obj, true)

				go:SetActive(false)

				if callback ~= nil then
					callback(go)
				end
			end)
		else
			XObjectPool.Load(abName, assetName, true, function(objs)
				if objs[0] == nil then
					SystemHelper.LogError(string.format("[ Not found !!! %s - %s ]", abName, assetName))
				end

				go = XObjectPool.Instantiate(objs[0], true)

				go:SetActive(false)

				if callback ~= nil then
					callback(go)
				end
			end)
		end
	elseif #pool == 1 then
		local go = XObjectPool.Instantiate(pool[1], true)

		go:SetActive(true)

		if callback ~= nil then
			callback(go)
		end
	else
		go = pool[#pool]

		table.remove(pool, #pool)
		XObjectPool.Popup(go)

		if callback ~= nil then
			callback(go)
		end
	end
end

function XObjectPool.Popup(go)
	go:SetActive(true)
end

function XObjectPool.Instantiate(prefab, addinPool)
	XObjectPool.GetPoolRootObject()

	local go = GoInstantiate(prefab)

	go.name = prefab.name

	if addinPool then
		go.transform:SetParent(poolRootObject.transform)
		go:SetActive(false)
	end

	go.transform.localScale = Vector3.one
	go.transform.localPosition = Vector3.zero
	go.transform.localEulerAngles = Vector3.zero

	return go
end

function XObjectPool.GetNumMax(abName, assetName)
	if objectMaxTbl[abName] == nil then
		return 0
	end

	if objectMaxTbl[abName][assetName] == nil then
		return 0
	end

	return objectMaxTbl[abName][assetName]
end

function XObjectPool.SetNumMax(abName, assetName, maxNum)
	if objectMaxTbl[abName] == nil then
		objectMaxTbl[abName] = {}
	end

	objectMaxTbl[abName][assetName] = maxNum
end

function XObjectPool.SetPortraitIcon(id, url, img)
	if url == nil or url == "" then
		local sprite = XObjectPool.GetIcon("headIcon" .. string.format("%02d", tonumber(id)))

		img:SetSprite(sprite)
	elseif UrlIconTbl[url] ~= nil then
		img:SetSprite(UrlIconTbl[url])
	else
		coroutine.start(function()
			local www = UnityEngine.WWW(url)

			coroutine.www(www)

			if www.error == nil then
				local sprite = UnityEngine.Sprite.Create(www.texture, UnityEngine.Rect.New(0, 0, www.texture.width, www.texture.height), Vector2.New(0, 0))

				UrlIconTbl[url] = sprite

				img:SetSprite(UrlIconTbl[url])
			else
				local sprite = XObjectPool.GetIcon("headIcon" .. string.format("%02d", tonumber(id)))

				img:SetSprite(sprite)
			end
		end)
	end
end

return XObjectPool
