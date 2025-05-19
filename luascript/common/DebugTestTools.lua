-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/DebugTestTools.lua

DebugTestTools = class("DebugTestTools")
DebugTestTools.static.Debug = false
DebugTestTools.static.ShowDetail = false

local getTime = os.date("%Y-%m-%d_%H-%M-%S")
local fileName = UnityEngine.Application.persistentDataPath .. "test_" .. getTime .. ".txt"
local printTimeStartList = {}
local printTimeList = {}
local printTimeLogList = {}
local printBufferList = {}
local printEnable = false

function DebugTestTools.GetTime()
	return TimeHelper.getNowTime() * 1000
end

function DebugTestTools.PrintOff()
	printEnable = false
end

function DebugTestTools.PrintOn()
	printEnable = true
end

function DebugTestTools.Print()
	if DebugTestTools.Debug == false then
		return
	end

	if printEnable == false then
		return
	end

	if DebugTestTools.ShowDetail == true then
		if printBufferList ~= nil then
			local file = io.open(fileName, "a+")
			local printData = table.concat(printBufferList)

			file:write(printData)
			file:close()
		end

		printBufferList = {}
	else
		local printData = ""

		for key, value in pairs(printTimeList) do
			local data = "key=" .. key .. ",time=" .. value .. "\r\n"

			printData = printData .. data
		end

		if printData ~= "" then
			local file = io.open(fileName, "a+")

			file:write(printData)
			file:close()
		end
	end
end

function DebugTestTools.PrintTimeStart(key)
	if DebugTestTools.Debug == false then
		return
	end

	printTimeStartList[key] = DebugTestTools.GetTime()
end

function DebugTestTools.PrintTimeEnd(key)
	if DebugTestTools.Debug == false then
		return
	end

	if printEnable == false then
		return
	end

	if printTimeStartList[key] ~= nil then
		local time = DebugTestTools.GetTime()
		local diffTime = time - printTimeStartList[key]

		if DebugTestTools.ShowDetail == true then
			local data = "key=" .. key .. ",time=" .. diffTime .. "\r\n"

			table.insert(printBufferList, data)
		elseif printTimeList[key] == nil then
			printTimeList[key] = diffTime
		elseif diffTime > printTimeList[key] then
			printTimeList[key] = diffTime
		end
	end
end

function DebugTestTools.Log(txt)
	if DebugTestTools.Debug == false then
		return
	end

	if DebugTestTools.ShowDetail == false then
		return
	end

	if printEnable == false then
		return
	end

	local data = txt .. "\r\n"

	table.insert(printBufferList, data)
end

function DebugTestTools.LogVector3(key, pos)
	if DebugTestTools.Debug == false then
		return
	end

	if DebugTestTools.ShowDetail == false then
		return
	end

	if printEnable == false then
		return
	end

	local data = key .. ":x=" .. pos.x .. ",y=" .. pos.y .. ",z=" .. pos.z .. ";\r\n"

	table.insert(printBufferList, data)
end

return DebugTestTools
