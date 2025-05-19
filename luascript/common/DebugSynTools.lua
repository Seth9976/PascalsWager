-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/DebugSynTools.lua

DebugSynTools = class("DebugSynTools")
DebugSynTools.static.Debug = false

local logNum = 1
local currentLogFrame = 1
local getTime = os.date("%Y-%m-%d_%H-%M-%S")
local fileName = UnityEngine.Application.persistentDataPath .. getTime .. ".txt"
local LogData = {
	Position = {},
	Rotation = {}
}

function DebugSynTools.SetFrame(frame)
	if DebugSynTools.Debug == false then
		return
	end

	if frame > currentLogFrame then
		local file = io.open(fileName, "a+")

		file:write("Frame:" .. frame - 1 .. "\r\n")
		file:close()
	end

	currentLogFrame = frame
end

function DebugSynTools.Log(txt, key)
	if DebugSynTools.Debug == false then
		return
	end

	local file = io.open(fileName, "a+")
	local info = key .. ":" .. txt .. ";"

	file:write(tostring(info))
	file:close()
end

function DebugSynTools.LogIgnore(txt, key)
	if DebugSynTools.Debug == false then
		return
	end

	local file = io.open(fileName, "a+")
	local info = "Ignore_" .. key .. ":" .. txt .. ";"

	file:write(tostring(info))
	file:close()
end

function DebugSynTools.LogVector2(pos, key)
	if DebugSynTools.Debug == false then
		return
	end

	local file = io.open(fileName, "a+")
	local info = key .. ":" .. pos.x .. "/" .. pos.y .. ";"

	file:write(tostring(info))
	file:close()
end

function DebugSynTools.LogVector3(pos, key)
	if DebugSynTools.Debug == false then
		return
	end

	local file = io.open(fileName, "a+")
	local info = key .. ":" .. pos.x .. "/" .. pos.y .. "/" .. pos.z .. ";"

	file:write(tostring(info))
	file:close()
end

function DebugSynTools.LogAnimal(...)
	if DebugSynTools.Debug == false then
		return
	end

	local animals = {
		...
	}

	if table.nums(animals) <= 0 then
		return
	end

	local file = io.open(fileName, "a+")

	for i = 1, table.nums(animals) do
		local modelName = animals[i].modelName .. "_" .. animals[i].animalId
		local position = "position:" .. animals[i].tfSelf.position.x .. "/" .. animals[i].tfSelf.position.y .. "/" .. animals[i].tfSelf.position.z
		local rotation = "rotation:" .. animals[i].tfSelf.rotation.x .. "/" .. animals[i].tfSelf.rotation.y .. "/" .. animals[i].tfSelf.rotation.z

		file:write(tostring(modelName) .. "[" .. tostring(position) .. "," .. tostring(rotation) .. "]" .. ";")
	end

	file:close()
end

function DebugSynTools.TurnLine()
	local file = io.open(fileName, "a+")

	file:write("\r\n")
	file:close()
end

return DebugSynTools
