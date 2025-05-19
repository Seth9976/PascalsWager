-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Challenge.lua

LS_Challenge = class("LS_Challenge")
LS_Challenge.keyName = "challenge"
LS_Challenge.keyUserId = "1"

function LS_Challenge.GetKey()
	return LS_Challenge.keyName .. "_" .. LS_Challenge.keyUserId
end

function LS_Challenge.GetKeyByUser(userId)
	return LS_Challenge.keyName .. "_" .. userId
end

function LS_Challenge.IsReadable(userId)
	LS_Challenge.keyUserId = userId

	return Recorder.IsHaveRecorder(LS_Challenge.GetKey())
end

function LS_Challenge.Load(userId)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Challenge.Load : No Action!!! ]")

		return
	end

	LS_Challenge.keyUserId = userId

	if userId == "1" then
		FS_UserData.challenge:Clear()

		FS_UserData.challenge = FS_Challenge:new()

		return
	end

	if tonumber(userId) <= 0 then
		-- block empty
	end

	local retStr = Recorder.read(LS_Challenge.GetKey())

	if retStr and type(retStr) == "string" then
		local val = json.decode(retStr)

		LS_Challenge.Decode(val)
	else
		LS_Challenge.Update()
	end
end

function LS_Challenge.SetUserId(userId)
	LS_Challenge.keyUserId = userId
end

function LS_Challenge.Update()
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Challenge.Update : No Action!!! ]")

		return
	end

	if LS_Challenge.keyUserId == "1" or LS_Challenge.keyUserId == 1 then
		return
	end

	local retStr = LS_Challenge.Encode()

	Recorder.write(LS_Challenge.GetKey(), retStr)
end

function LS_Challenge.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.challenge = FS_UserData.challenge:Encode()
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Challenge.Write(data)
	Recorder.write(LS_Challenge.GetKey(), data)
end

function LS_Challenge.Decode(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "challenge") then
			FS_UserData.challenge:Decode(tmpJsonSub.challenge)
		end
	end
end

function LS_Challenge.Delete()
	local filename = LS_Challenge.GetKey()

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Challenge.Remove(userId)
	local filename = LS_Challenge.keyName .. "_" .. userId

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Challenge.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Challenge.Rename(userId)
	local srcName = LS_Challenge.keyName .. "_1"
	local dstName = LS_Challenge.keyName .. "_" .. userId
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Challenge.Move(srcName, dstName)
	end
end

function LS_Challenge.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		return false
	end
end

return LS_Challenge
