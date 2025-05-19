-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/XFunctions.lua

function log(str)
	SystemHelper.Log(str)
end

function logError(str)
	SystemHelper.LogError(str)
end

function logWarn(str)
	SystemHelper.LogTest(str)
end

function GoFind(str)
	return GameObject.Find(str)
end

function GoFindInScene(sceneName, objName)
	return Common.FindObjectFromScene(sceneName, objName)
end

function GoDestroy(obj)
	if obj ~= nil then
		GameObject.Destroy(obj)
	end
end

function GoDestroyImmediate(obj)
	if obj ~= nil then
		GameObject.DestroyImmediate(obj, true)
	end
end

function GoInstantiate(prefab)
	if prefab ~= nil then
		return GameObject.Instantiate(prefab)
	end

	SystemHelper.LogError("==========GoInstantiate=====prefab=null=!!!!!!==t=" .. t)

	return nil
end

function GoCreate(name)
	local go = GameObject.New()

	go.name = name

	return go
end

function TfFindChild(tf, name)
	if tf ~= nil and name ~= "" then
		return tf:Find(name)
	end

	return nil
end

function IsNil(uobj)
	return uobj == nil or uobj:Equals(nil)
end

function createPanel(name)
	PanelManager:CreatePanel(name)
end

function child(str)
	return transform:Find(str)
end

function subGet(childNode, typeName)
	return child(childNode):GetComponent(typeName)
end

function findPanel(str)
	local obj = find(str)

	if obj == nil then
		error(str .. " is null")

		return nil
	end

	return obj:GetComponent("BaseLua")
end

function table.nums(t)
	local count = 0

	if t == nil then
		return 0
	end

	for k, v in pairs(t) do
		count = count + 1
	end

	return count
end

function table.unique(t, bArray)
	local check = {}
	local n = {}
	local idx = 1

	for k, v in pairs(t) do
		if not check[v] then
			if bArray then
				n[idx] = v
				idx = idx + 1
			else
				n[k] = v
			end

			check[v] = true
		end
	end

	return n
end

function table.clone(object)
	local lookup_table = {}

	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end

		local new_table = {}

		lookup_table[object] = new_table

		for key, value in pairs(object) do
			new_table[_copy(key)] = _copy(value)
		end

		return setmetatable(new_table, getmetatable(object))
	end

	return _copy(object)
end

function table.merge(tDest, tSrc)
	for k, v in pairs(tSrc) do
		tDest[k] = v
	end
end

function table.append(t1, t2)
	for i = 1, #t2 do
		table.insert(t1, t2[i])
	end
end

function table.add(tDest, tSrc)
	for k, v in pairs(tSrc) do
		table.insert(tDest, v)
	end
end

function table.removeValue(t, val)
	if t == nil then
		return
	end

	for _k, _v in pairs(t) do
		if _v == val then
			table.remove(t, _k)

			break
		end
	end
end

function table.contains(t, val)
	if t == nil then
		return false
	end

	for _k, _v in pairs(t) do
		if _v == val then
			return true
		end
	end

	return false
end

function table.keys(t)
	local keys = {}

	for k, _ in pairs(t) do
		keys[#keys + 1] = k
	end

	return keys
end

function table.shuffle(tbl)
	for i = #tbl, 2, -1 do
		local j = math.random(i)

		tbl[i], tbl[j] = tbl[j], tbl[i]
	end

	return tbl
end

function table.getRandomValue(tbl)
	if tbl ~= nil then
		local tmpList = {}

		for k, v in pairs(tbl) do
			table.insert(tmpList, v)
		end

		if #tmpList > 0 then
			tmpList = table.shuffle(tmpList)

			return tmpList[1]
		end
	end

	return nil
end

function string.split(str, delimiter)
	str = tostring(str)
	delimiter = tostring(delimiter)

	if delimiter == "" then
		return false
	end

	local pos, arr = 0, {}

	for st, sp in function()
		return string.find(str, delimiter, pos, true)
	end do
		table.insert(arr, string.sub(str, pos, st - 1))

		pos = sp + 1
	end

	table.insert(arr, string.sub(str, pos))

	return arr
end
