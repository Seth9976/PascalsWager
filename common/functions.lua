-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Common/functions.lua

function log(str)
	Util.Log(str)
end

function logError(str)
	Util.LogError(str)
end

function logWarn(str)
	Util.LogWarning(str)
end

function find(str)
	return GameObject.Find(str)
end

function destroy(obj)
	GameObject.Destroy(obj)
end

function newObject(prefab)
	return GameObject.Instantiate(prefab)
end

function createPanel(name)
	PanelManager:CreatePanel(name)
end

function child(str)
	return transform:FindChild(str)
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
