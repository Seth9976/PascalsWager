-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Achievement.lua

LS_Achievement = class("LS_Achievement")

if AppVer == AppTapTapEA then
	LS_Achievement.keyName = "eaachievement"
else
	LS_Achievement.keyName = "achievement"
end

LS_Achievement.keyUserId = "1"

function LS_Achievement.GetKey()
	return LS_Achievement.keyName .. "_" .. LS_Achievement.keyUserId
end

function LS_Achievement.GetKeyByUser(userId)
	return LS_Achievement.keyName .. "_" .. userId
end

function LS_Achievement.IsReadable(userId)
	LS_Achievement.keyUserId = userId

	return Recorder.IsHaveRecorder(LS_Achievement.GetKey())
end

function LS_Achievement.Load(userId)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Achievement.Load : No Action!!! ]")

		return
	end

	if tonumber(userId) <= 0 then
		-- block empty
	end

	LS_Achievement.keyUserId = userId

	local retStr = Recorder.read(LS_Achievement.GetKey())

	if retStr and type(retStr) == "string" then
		local val = json.decode(retStr)

		LS_Achievement.Decode(val)
	else
		LS_Achievement.Update()
	end
end

function LS_Achievement.SetUserId(userId)
	LS_Achievement.keyUserId = userId
end

function LS_Achievement.Update(notUpdate)
	if AppVer == AppAppleLight or AppVer == AppCJ2020 then
		SystemHelper.Log("[ LS_Achievement.Update : No Action!!! ]")

		return
	end

	local retStr, n_, retStrForUpdate, needUpdate = LS_Achievement.Encode()

	Recorder.write(LS_Achievement.GetKey(), retStr)

	if not notUpdate and needUpdate then
		local achFinalList = FS_UserData.achievement.achievementFinishList

		if achFinalList ~= nil then
			for i = 1, #achFinalList do
				SystemHelper.Log("achID:" .. achFinalList[i])
			end
		end

		SdkHelper.SetAchievement(retStrForUpdate, LS_Achievement.UpdateCallback)
	end
end

function LS_Achievement.UpdateCallback(result, code)
	if result == true then
		FS_UserData.achievement:SendSuccess()
		SystemHelper.Log("[ LS_Achievement.UpdateCallback: " .. code .. " ]")
		SystemHelper.Log("achievement上传成功!")
	else
		SystemHelper.Log("[ LS_Achievement.UpdateCallback Code: " .. code .. " ]")
		SystemHelper.Log("achievement上传失败!--")
	end
end

function LS_Achievement.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.achievement = FS_UserData.achievement:Encode()

	local tmpJsonSubOnlyFinish = {}

	tmpJsonSubOnlyFinish.achievement = FS_UserData.achievement:EncodeFinishList()
	jsonData.result = tmpJsonSub

	return json.encode(jsonData), json.encode(tmpJsonSub), json.encode(tmpJsonSubOnlyFinish), FS_UserData.achievement:HasNew()
end

function LS_Achievement.Write(data)
	Recorder.write(LS_Achievement.GetKey(), data)
end

function LS_Achievement.SmartWrite(data)
	if data and data ~= "" then
		FS_UserData.achievement:SmartDecode(data)
	end

	LS_Achievement.Update()
end

function LS_Achievement.Decode(p_val)
	if p_val == nil then
		return
	end

	print_r(p_val)

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "achievement") then
			FS_UserData.achievement:Decode(tmpJsonSub.achievement)
		end
	end
end

function LS_Achievement.Delete()
	local filename = LS_Achievement.GetKey()

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Achievement.Remove(userId)
	local filename = LS_Achievement.keyName .. "_" .. userId

	if Recorder.IsHaveRecorder(filename) then
		Recorder.Delete(filename)

		return true
	else
		return false
	end
end

function LS_Achievement.Copy(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Copy(src, dst)

		return true
	else
		return false
	end
end

function LS_Achievement.Move(src, dst)
	if Recorder.IsHaveRecorder(src) then
		Recorder.Move(src, dst)

		return true
	else
		return false
	end
end

function LS_Achievement.MergeGuest(userId)
	LS_Achievement.Load(1)

	local fData = {}
	local ret = FS_UserData.achievement:EncodeFinishList()

	fData.achievement_finish = {}

	for k, v in pairs(ret.achievement_finish) do
		table.insert(fData.achievement_finish, v)
	end

	LS_Achievement.Load(userId)
	LS_Achievement.SmartWrite(fData)
end

function LS_Achievement.Rename(userId)
	local srcName = LS_Achievement.keyName .. "_1"
	local dstName = LS_Achievement.keyName .. "_" .. userId
	local hasSrc = Recorder.IsHaveRecorder(srcName)
	local hasDst = Recorder.IsHaveRecorder(dstName)

	if hasSrc then
		LS_Achievement.Move(srcName, dstName)
	end
end

function LS_Achievement.GenerateSaveData(userId)
	return
end

return LS_Achievement
