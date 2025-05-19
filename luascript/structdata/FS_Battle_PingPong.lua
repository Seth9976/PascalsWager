-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_PingPong.lua

FS_Battle_PingPong = class("FS_Battle_PingPong")
FS_Battle_PingPong.static.PingTimeMax = 500
FS_Battle_PingPong.pingPongTimeMax = 10
FS_Battle_PingPong.pingIndex = 0
FS_Battle_PingPong.pingIndexMax = 1000
FS_Battle_PingPong.pingLocalTimeList = {}
FS_Battle_PingPong.pingPongTimeList = {}
FS_Battle_PingPong.pingPongAvgTime = 0
FS_Battle_PingPong.getPongServerTimestamp = 0
FS_Battle_PingPong.getPongLocalTime = 0
FS_Battle_PingPong.getPongLocalTimestamp = 0
FS_Battle_PingPong.pingFrameIndex = 0
FS_Battle_PingPong.pingFrameTime = 0
FS_Battle_PingPong.pingShowTime = 0

function FS_Battle_PingPong.initialize()
	FS_Battle_PingPong.pingIndex = 0
	FS_Battle_PingPong.pingLocalTimeList = {}
	FS_Battle_PingPong.pingPongTimeList = {}
	FS_Battle_PingPong.pingPongAvgTime = 0
	FS_Battle_PingPong.getPongServerTimestamp = 0
	FS_Battle_PingPong.getPongLocalTime = 0
	FS_Battle_PingPong.getPongLocalTimestamp = 0
	FS_Battle_PingPong.pingFrameIndex = 0
	FS_Battle_PingPong.pingFrameTime = 0
	FS_Battle_PingPong.pingShowTime = 0
end

function FS_Battle_PingPong.Parse(info)
	if info ~= nil then
		local index = tonumber(info.index)
		local time = tonumber(info.time)

		FS_Battle_PingPong.getPongLocalTime = TimeHelper.getNowMicroTime()
		FS_Battle_PingPong.getPongLocalTimestamp = FS_Battle_PingPong.GetLocalTimestamp()

		if FS_Battle_PingPong.pingLocalTimeList[index] ~= nil then
			local diff = FS_Battle_PingPong.getPongLocalTime - FS_Battle_PingPong.pingLocalTimeList[index]

			FS_Battle_PingPong.pingLocalTimeList[index] = 0

			FS_Battle_PingPong.AddPingPongTime(diff)
			FS_Battle_PingPong.UpdateServerTime(time)
		end
	end
end

function FS_Battle_PingPong.IsGetFirstPong()
	if FS_Battle_PingPong.getPongServerTimestamp > 0 then
		return true
	end

	return false
end

function FS_Battle_PingPong.SendFrame(frameIndex)
	if frameIndex > FS_Battle_PingPong.pingFrameIndex then
		FS_Battle_PingPong.pingFrameIndex = frameIndex
		FS_Battle_PingPong.pingFrameTime = TimeHelper.getNowMicroTime()
	end
end

function FS_Battle_PingPong.ReceiveFrame(frameIndex, isPredicted)
	if frameIndex < FS_Battle_PingPong.pingFrameIndex then
		return
	elseif frameIndex > FS_Battle_PingPong.pingFrameIndex then
		FS_Battle_PingPong.AddBattleFrameTime(FS_Battle_PingPong.PingTimeMax)
	elseif isPredicted == false then
		local nowTime = TimeHelper.getNowMicroTime()
		local diffTime = nowTime - FS_Battle_PingPong.pingFrameTime

		diffTime = diffTime / ControllerMain.LogicFrameTimesPerNetFrame

		FS_Battle_PingPong.AddBattleFrameTime(diffTime)
	else
		FS_Battle_PingPong.AddBattleFrameTime(FS_Battle_PingPong.PingTimeMax)
	end
end

function FS_Battle_PingPong.CalcPingPongAvgTime()
	local pingSum = 0

	if #FS_Battle_PingPong.pingPongTimeList > 0 then
		for i = 1, #FS_Battle_PingPong.pingPongTimeList do
			local t = FS_Battle_PingPong.pingPongTimeList[i]

			pingSum = pingSum + t
		end

		FS_Battle_PingPong.pingPongAvgTime = pingSum / #FS_Battle_PingPong.pingPongTimeList
	end
end

function FS_Battle_PingPong.ShowPingStatus()
	local nowTime = os.time()

	if nowTime > FS_Battle_PingPong.pingShowTime then
		UIManager.SendMessage("Mainmenu", "UpdateNetworkStatus", Mathf.Round(FS_Battle_PingPong.pingPongAvgTime))

		FS_Battle_PingPong.pingShowTime = nowTime + 1
	end
end

function FS_Battle_PingPong.Ping()
	FS_Battle_PingPong.pingIndex = FS_Battle_PingPong.pingIndex + 1

	if FS_Battle_PingPong.pingIndex > FS_Battle_PingPong.pingIndexMax then
		FS_Battle_PingPong.pingIndex = 1
	end

	FS_Battle_PingPong.pingLocalTimeList[FS_Battle_PingPong.pingIndex] = TimeHelper.getNowMicroTime()

	return FS_Battle_PingPong.pingIndex
end

function FS_Battle_PingPong.AddBattleFrameTime(diff)
	table.insert(FS_Battle_PingPong.pingPongTimeList, diff)

	if #FS_Battle_PingPong.pingPongTimeList > FS_Battle_PingPong.pingPongTimeMax then
		table.remove(FS_Battle_PingPong.pingPongTimeList, 1)
	end

	FS_Battle_PingPong.CalcPingPongAvgTime()
end

function FS_Battle_PingPong.AddPingPongTime(diff)
	table.insert(FS_Battle_PingPong.pingPongTimeList, diff)

	if #FS_Battle_PingPong.pingPongTimeList > FS_Battle_PingPong.pingPongTimeMax then
		table.remove(FS_Battle_PingPong.pingPongTimeList, 1)
	end

	FS_Battle_PingPong.CalcPingPongAvgTime()

	if #FS_Battle_PingPong.pingLocalTimeList > 0 then
		local lostSum = 0

		for i = 1, #FS_Battle_PingPong.pingLocalTimeList do
			local t = FS_Battle_PingPong.pingLocalTimeList[i]

			if t > 0 then
				lostSum = lostSum + 1
			end
		end
	end
end

function FS_Battle_PingPong.UpdateServerTime(time)
	local timePassed = FS_Battle_PingPong.pingPongAvgTime / 2

	FS_Battle_PingPong.getPongServerTimestamp = time + timePassed / 1000
end

function FS_Battle_PingPong.GetLocalTimestamp()
	return os.time()
end

function FS_Battle_PingPong.GetServerTime()
	local ret = FS_Battle_PingPong.getPongServerTimestamp - FS_Battle_PingPong.getPongLocalTimestamp + FS_Battle_PingPong.GetLocalTimestamp()

	return ret
end
