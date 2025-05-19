-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Arcade.lua

LS_Arcade = class("LS_Arcade")
LS_Arcade.keyName = "arcade"
LS_Arcade.keyUserId = "1"

function LS_Arcade.GetKey()
	return LS_Arcade.keyName .. "_" .. LS_Arcade.keyUserId
end

function LS_Arcade.GetKeyByUser(userId)
	return LS_Arcade.keyName .. "_" .. userId
end

function LS_Arcade.IsReadable(userId)
	LS_Arcade.keyUserId = userId

	return Recorder.IsHaveRecorder(LS_Arcade.GetKey())
end

function LS_Arcade.Load(userId)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Arcade.Load : No Action!!! ]")

		return
	end

	LS_Arcade.keyUserId = userId

	if userId == "1" then
		FS_UserData.arcade:Clear()

		FS_UserData.arcade = FS_Arcade:new()

		return
	end

	if tonumber(userId) <= 0 then
		-- block empty
	end

	local retStr = Recorder.read(LS_Arcade.GetKey())

	if retStr and type(retStr) == "string" then
		local val = json.decode(retStr)

		LS_Arcade.Decode(val)
	else
		LS_Arcade.Update()
	end
end

function LS_Arcade.SetUserId(userId)
	LS_Arcade.keyUserId = userId
end

function LS_Arcade.Update()
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Arcade.Update : No Action!!! ]")

		return
	end

	if LS_Arcade.keyUserId == "1" or LS_Arcade.keyUserId == 1 then
		return
	end

	local retStr = LS_Arcade.Encode()

	Recorder.write(LS_Arcade.GetKey(), retStr)
end

function LS_Arcade.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.arcade = FS_UserData.arcade:Encode()
	jsonData.result = tmpJsonSub

	return json.encode(jsonData)
end

function LS_Arcade.Write(data)
	Recorder.write(LS_Arcade.GetKey(), data)
end

function LS_Arcade.Decode(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "arcade") then
			FS_UserData.arcade:Decode(tmpJsonSub.arcade)
		end
	end
end

function LS_Arcade.Delete()
	local filename = LS_Arcade.GetKey()

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Arcade.Remove(userId)
	local filename = LS_Arcade.keyName .. "_" .. userId

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Arcade.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Arcade.Rename(userId)
	local srcName = LS_Arcade.keyName .. "_1"
	local dstName = LS_Arcade.keyName .. "_" .. userId
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Arcade.Move(srcName, dstName)
	end
end

function LS_Arcade.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		return false
	end
end

return LS_Arcade
