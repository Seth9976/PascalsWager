-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/TimeHelper.lua

TimeHelper = {}
TimeHelper.timestamp = 0
TimeHelper.deltaTime = 0.016666666666666666

function TimeHelper.getNowTime()
	return Time.time
end

function TimeHelper.getNowTimeNoScale()
	return Time.realtimeSinceStartup
end

function TimeHelper.getNowMicroTime()
	return Mathf.Round(Time.time * 1000)
end

function TimeHelper.resetDeltaTime()
	TimeHelper.timestamp = 0
	TimeHelper.deltaTime = 0.016666666666666666
end

function TimeHelper.getDeltaTime()
	if MathHelper.IsZero(TimeHelper.timestamp) then
		TimeHelper.timestamp = Time.realtimeSinceStartup
	else
		local currentTime = Time.realtimeSinceStartup

		TimeHelper.deltaTime = currentTime - TimeHelper.timestamp
		TimeHelper.timestamp = currentTime
	end

	return TimeHelper.deltaTime
end

function TimeHelper.getTimeVal(hour, min, sec)
	local timeVal = hour * 3600 + min * 60 + sec

	return timeVal
end

function TimeHelper.getTimeSpan(timeVal)
	local days = math.floor(timeVal / 86400)
	local hour = math.floor(timeVal / 3600)
	local min = math.floor((timeVal - hour * 3600) / 60)
	local sec = timeVal % 60
	local cs = Mathf.Round(timeVal * 100 - math.floor(timeVal) * 100)
	local totalDays = days
	local totalHours = hour
	local ret = {
		Hours = string.format("%02d", hour),
		Minutes = string.format("%02d", min),
		Seconds = string.format("%02d", sec),
		Centiseconds = string.format("%02d", cs),
		TotalDays = totalDays,
		TotalHours = totalHours
	}

	return ret
end

function TimeHelper.ParseDataTime(timeStr)
	local subArr = StringHelper.Split(timeStr, " ")
	local dateArr = StringHelper.Split(subArr[1], "-")
	local timeArr = StringHelper.Split(subArr[2], ":")
	local format = {
		year = tonumber(dateArr[1]),
		month = tonumber(dateArr[2]),
		day = tonumber(dateArr[3]),
		hour = tonumber(timeArr[1]),
		min = tonumber(timeArr[2]),
		sec = tonumber(timeArr[3])
	}
	local timezoneDiff = os.date("*t", 0).hour

	if format.year < 1970 then
		format.year = 1970

		if timezoneDiff > format.hour then
			format.hour = timezoneDiff
		end
	end

	if format.year > 2038 then
		format.year = 2038
		format.month = 1
		format.day = 1
	end

	local timeVal = os.time(format)

	return timeVal
end

function TimeHelper.ToShortDateString(timeVal)
	local ret = os.date("%Y/%m/%d", timeVal)

	return ret
end

local function get_timezone()
	local now = os.time()

	return os.difftime(now, os.time(os.date("!*t", now)))
end

timezone = get_timezone()

local function get_tzoffset(timezone)
	local h, m = math.modf(timezone / 3600)

	return string.format("%+.4d", 100 * h + 60 * m)
end

tzoffset = get_tzoffset(timezone)

function TimeHelper.get_timezone_offset(ts)
	local utcdate = os.date("!*t", ts)
	local localdate = os.date("*t", ts)

	localdate.isdst = false

	return os.difftime(os.time(localdate), os.time(utcdate))
end

function TimeHelper.getUtcTime()
	local ts = os.time()
	local tzo = TimeHelper.get_timezone_offset(ts)

	return ts - tzo, tzo
end

function TimeHelper.getUTC()
	local ts = os.time()

	return os.time(os.date("!*t", ts))
end

function TimeHelper.slowTime(time)
	Time.timeScale = time
end
