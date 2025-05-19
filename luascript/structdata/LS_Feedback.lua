-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Feedback.lua

LS_Feedback = class("LS_Feedback")

if AppVer == AppTapTapEA then
	LS_Feedback.keyName = "eafeedback"
else
	LS_Feedback.keyName = "feedback"
end

LS_Feedback.keyUserId = "1"

function LS_Feedback.GetKey()
	return LS_Feedback.keyName .. "_" .. LS_Feedback.keyUserId
end

function LS_Feedback.IsReadable(userId)
	LS_Feedback.keyUserId = userId

	return Recorder.IsHaveRecorder(LS_Feedback.GetKey())
end

function LS_Feedback.Load(userId)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Feedback.Load : No Action!!! ]")

		return
	end

	LS_Feedback.keyUserId = userId

	if userId == "1" then
		FS_UserData.feedback:Clear()

		FS_UserData.feedback = FS_Feedback:new()

		return
	end

	if tonumber(userId) <= 0 then
		-- block empty
	end

	local retStr = Recorder.read(LS_Feedback.GetKey())

	if retStr and type(retStr) == "string" then
		local val = json.decode(retStr)

		LS_Feedback.Decode(val)
	else
		LS_Feedback.Update()
	end
end

function LS_Feedback.SetUserId(userId)
	LS_Feedback.keyUserId = userId
end

function LS_Feedback.Update()
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Feedback.Update : No Action!!! ]")

		return
	end

	if LS_Feedback.keyUserId == "1" or LS_Feedback.keyUserId == 1 then
		return
	end

	local retStr = LS_Feedback.Encode()

	Recorder.write(LS_Feedback.GetKey(), retStr)
end

function LS_Feedback.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.feedback = FS_UserData.feedback:Encode()
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Feedback.Write(data)
	Recorder.write(LS_Feedback.GetKey(), data)
end

function LS_Feedback.Decode(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "feedback") then
			FS_UserData.feedback:Decode(tmpJsonSub.feedback)
		end
	end
end

function LS_Feedback.Delete()
	local filename = LS_Feedback.GetKey()

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Feedback.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Feedback.Rename(userId)
	local srcName = LS_Feedback.keyName .. "_1"
	local dstName = LS_Feedback.keyName .. "_" .. userId
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Feedback.Move(srcName, dstName)
	end
end

return LS_Feedback
