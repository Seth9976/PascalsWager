-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_Account.lua

LS_Account = class("LS_Account")
LS_Account.static.LoginType = {
	Weibo = 7,
	Line = 9,
	QQ = 4,
	Facebook = 6,
	WeChat = 3,
	Apple = 16,
	Google = 5,
	Twitter = 8,
	Guest = 0
}
LS_Account.static.CH_ANDROID_TAP_TAP = "ANDROID_TAP_TAP"
LS_Account.static.CH_ANDROID_GOOGLE_PLAY = "ANDROID_GOOGLE_PLAY"
LS_Account.static.CH_ANDROID_HUAWEI = "ANDROID_HUAWEI"
LS_Account.static.CH_ANDROID_UNION = "ANDROID_UNION"

if AppVer == AppTapTapEA then
	LS_Account.keyName = "eaaccount"
else
	LS_Account.keyName = "account"
end

LS_Account.login = 0
LS_Account.userId = "1"
LS_Account.userName = ""
LS_Account.password = ""
LS_Account.age = 0
LS_Account.nickname = ""
LS_Account.errno = 0
LS_Account.previousUserId = ""
LS_Account.previousLogin = -1
LS_Account.agreePrivacy = "0"

function LS_Account.GetKey()
	return LS_Account.keyName
end

function LS_Account.Load()
	local retStr

	if AppVer ~= AppAppleDemo and AppVer ~= AppAppleShow then
		retStr = Recorder.read(LS_Account.GetKey())
	else
		retStr = "{\"result\":{\"lgoin\":\"0\",\"userid\":1}}"
	end

	if retStr ~= nil then
		LS_Account.Decode(json.decode(retStr))
	end
end

function LS_Account.Update()
	if AppVer == AppAppleLight or AppVer == AppCJ2020 or AppVer == AppAppleDemo or AppVer == AppAppleShow then
		return
	end

	Recorder.write(LS_Account.GetKey(), LS_Account.Encode())
end

function LS_Account.Reset()
	LS_Account.userName = ""
	LS_Account.password = ""
	LS_Account.login = 0
	LS_Account.userId = "1"
	LS_Account.age = 0
	LS_Account.nickname = ""

	LS_Account.Update()
end

function LS_Account.Encode()
	local jsonData = {}
	local tmpJsonSub = {}

	tmpJsonSub.username = LS_Account.userName
	tmpJsonSub.password = LS_Account.password
	tmpJsonSub.login = tonumber(LS_Account.login)
	tmpJsonSub.userid = LS_Account.userId
	tmpJsonSub.age = LS_Account.age
	tmpJsonSub.nickname = LS_Account.nickname
	tmpJsonSub.agreePrivacy = LS_Account.agreePrivacy
	jsonData.result = tmpJsonSub

	SystemHelper.Log("Save LS_Account")

	return json.encode(jsonData)
end

function LS_Account.Decode(p_val)
	if p_val == nil then
		return
	end

	if p_val.result ~= nil then
		local tmpJsonSub = p_val.result

		LS_Account.userName = FS_ParserJson.toString(tmpJsonSub, "username")
		LS_Account.password = FS_ParserJson.toString(tmpJsonSub, "password")
		LS_Account.login = FS_ParserJson.toInt(tmpJsonSub, "login")
		LS_Account.userId = FS_ParserJson.toString(tmpJsonSub, "userid")
		LS_Account.age = FS_ParserJson.toInt(tmpJsonSub, "age")

		if FS_ParserJson.isValidKey(tmpJsonSub, "nickname") then
			LS_Account.nickname = FS_ParserJson.toString(tmpJsonSub, "nickname")
		else
			LS_Account.nickname = ""
		end

		if FS_ParserJson.isValidKey(tmpJsonSub, "agreePrivacy") then
			LS_Account.agreePrivacy = FS_ParserJson.toString(tmpJsonSub, "agreePrivacy")
		else
			LS_Account.agreePrivacy = "0"
		end
	end
end

function LS_Account.SetUserData(username, password)
	LS_Account.userName = username
	LS_Account.password = password
end

function LS_Account.SetAge(age)
	LS_Account.age = age

	LS_Account.Update()
end

function LS_Account.GetAge()
	return LS_Account.age
end

function LS_Account.SetNickname(nickname)
	if nickname ~= nil then
		LS_Account.nickname = tostring(nickname)
	end
end

function LS_Account.GetNickname()
	return LS_Account.nickname
end

function LS_Account.GetLoginType()
	return LS_Account.login
end

function LS_Account.SetLoginType(loginType)
	LS_Account.login = loginType
end

function LS_Account.SetUserId(userId, forceSet)
	if userId ~= nil and type(userId) == "string" then
		LS_Account.userId = userId
	end
end

function LS_Account.SetPreviousUserId(userId)
	LS_Account.previousUserId = userId
end

function LS_Account.GetPreviousUserId()
	return LS_Account.previousUserId
end

function LS_Account.HasLogoutPreviousUser()
	return LS_Account.previousUserId == ""
end

function LS_Account.SetPreviousLogin(loginType)
	LS_Account.previousLogin = loginType
end

function LS_Account.GetPreviousLogin()
	return LS_Account.previousLogin
end

function LS_Account.GetAgreePrivacy()
	return LS_Account.agreePrivacy
end

function LS_Account.SetAgreePrivacy()
	LS_Account.agreePrivacy = "1"
end

return LS_Account
