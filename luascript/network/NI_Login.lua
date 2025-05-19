-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Login.lua

NI_Login = class("NI_Login")

function NI_Login.CheckVer(callbackFun)
	local pageStr = "checkVer"
	local paramList = {
		{
			"ver",
			tostring(GameVersion)
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Login.CheckDeviceAccount(timestamp, callbackFun)
	local pageStr = "checkDeviceAccount"
	local deviceId = AppConst.deviceId
	local channelId = "test"
	local version = tostring(GameVersion)
	local signStr = Util.md5(deviceId .. channelId .. version .. timestamp .. AppConst.SecKey)

	Common.Log("DeviceID: " .. deviceId)
	Common.Log("ChannelID: " .. channelId)
	Common.Log("Version: " .. version)
	Common.Log("Timestamp: " .. timestamp)
	Common.Log("Sign: " .. signStr)

	local paramList = {
		{
			"deviceId",
			deviceId
		},
		{
			"channelId",
			channelId
		},
		{
			"ver",
			version
		},
		{
			"time",
			timestamp
		},
		{
			"sign",
			signStr
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Login.ActivationProduct(timestamp, codeEntered, callbackFun)
	local pageStr = "use3rdCode"
	local userId = LS_Account.userName
	local code = codeEntered
	local signStr = Util.md5(userId .. code .. timestamp .. AppConst.SecKey)

	Common.Log("UserID: " .. userId)
	Common.Log("Code: " .. code)
	Common.Log("Timestamp: " .. timestamp)
	Common.Log("Sign: " .. signStr)

	local paramList = {
		{
			"id",
			userId
		},
		{
			"code",
			code
		},
		{
			"time",
			timestamp
		},
		{
			"sign",
			signStr
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Login.Login(id, pass, callbackFun)
	if ReqLogin then
		local pageStr = "autoRegLoginOfTest"
		local paramList = {
			{
				"channelId",
				"test"
			},
			{
				"deviceId",
				"pc"
			},
			{
				"username",
				tostring(id)
			},
			{
				"password",
				tostring(pass)
			},
			{
				"ver",
				tostring(GameVersion)
			}
		}
		local paramStr = SystemHelper.ConvertHttpParam(paramList)

		networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
	else
		id = LS_Account.userId

		local jsonData = "{\"result\":{\"sign\":\"10000000000000000000000000000000\",\"id\":" .. id .. ",\"time\":1},\"success\":true}"

		callbackFun(jsonData)
	end
end

function NI_Login.ParseLoginResponse(jsonData)
	SystemHelper.LogTest("==================ParseLoginResponse==================")

	local v_data = json.decode(jsonData)

	if v_data == nil then
		SystemHelper.LogTest("======v_data=null")

		return false
	else
		local code = v_data.code
		local success = v_data.success

		if success == true then
			local p_ret = v_data.result

			FS_UserData.playerList:Login(p_ret.id, p_ret.sign, p_ret.time)

			return true
		end
	end

	return false
end

function NI_Login.GetServerList(accId, callbackFun)
	local pageStr = "serverList"
	local paramList = {
		{
			"channel",
			"test"
		},
		{
			"accId",
			tostring(accId)
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Login.ParseServerListResponse(jsonData)
	local v_data = json.decode(jsonData)

	if v_data == nil then
		return false
	else
		FS_UserData.serverList:ParseServerList(v_data)

		return true
	end
end

function NI_Login.GetDefaultServer(accId, callbackFun)
	if ReqLogin then
		local pageStr = "defaultServer"
		local paramList = {
			{
				"channel",
				"test"
			},
			{
				"accId",
				tostring(accId)
			}
		}
		local paramStr = SystemHelper.ConvertHttpParam(paramList)

		networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
	elseif AppConst.ReqEntry then
		local jsonData = "{\"no\":1,\"isDefault\":true,\"port\":9990,\"ip\":\"http://www.tips-works.com\",\"name\":\"Local|Local\",\"id\":\"10000\"}"

		callbackFun(jsonData)
	elseif AppVer == AppDemoInner or AppVer == AppDemoCJReview then
		local jsonData = "{\"no\":1,\"isDefault\":true,\"port\":9990,\"ip\":\"http://www.tips-works.com\",\"name\":\"Local|Local\",\"id\":\"10000\"}"

		callbackFun(jsonData)
	else
		local jsonData = "{\"no\":1,\"isDefault\":true,\"port\":10000,\"ip\":\"127.0.0.1\",\"name\":\"Local|Local\",\"id\":\"10000\"}"

		callbackFun(jsonData)
	end
end

function NI_Login.ParseDefaultServerResponse(jsonData)
	local v_data = json.decode(jsonData)

	if v_data == nil then
		return false
	else
		FS_UserData.serverList:ParseDefaultServer(v_data)

		return true
	end
end

function NI_Login.SaveServer(serverId, accId, sign, callbackFun)
	local pageStr = "saveServer"
	local paramList = {
		{
			"serverId",
			tostring(serverId)
		},
		{
			"accId",
			tostring(accId)
		},
		{
			"sign",
			tostring(sign)
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Login.LoginGame(callbackFunc)
	return
end

function NI_Login.GetPlayerList(callbackFunc)
	return
end

function NI_Login.CreateCharacter(callbackFunc)
	return
end

function NI_Login.OnLogin(success, code, accountId, loginType, nickname)
	SystemHelper.Log(string.format("[[[ NI_Login.OnLogin( succ=%s, code=%d, acc=%s, login=%d ]]]", tostring(success), code, accountId, loginType))

	if success == true then
		if string.len(accountId) > 1 then
			local previousUserId = LS_Account.userId
			local previousLoginType = LS_Account.login

			if previousUserId ~= accountId then
				NI_Login.OnLogout(previousUserId, previousLoginType)
			end

			LS_Account.SetPreviousUserId("")
			LS_Account.SetUserId(accountId)
			LS_Account.SetLoginType(loginType)
			LS_Account.SetAge(SdkHelper.GetUserAge())
			LS_Account.SetNickname(nickname)
			LS_Account.Update()
			LS_Setting.SetUserId(accountId)
			LS_Setting.SetNickname(nickname)

			if LS_Setting.IsReadable(accountId) then
				LS_Setting.Load(accountId)
				LS_Autosave.SetUserId(accountId)
				LS_Game.SetUserId(accountId)
				LS_PlayerBehavior.SetUserId(accountId)
				LS_Achievement.Load(LS_Account.userId)
				LS_Challenge.Load(LS_Account.userId)
				LS_Arcade.Load(LS_Account.userId)
			else
				if previousUserId ~= accountId and (string.len(previousUserId) == 1 and previousLoginType == LS_Account.LoginType.Guest and loginType == LS_Account.LoginType.Guest or string.len(previousUserId) > 1 and previousLoginType == LS_Account.LoginType.Guest and loginType == LS_Account.LoginType.Apple) then
					LS_Achievement.Copy(LS_Achievement.GetKeyByUser(previousUserId), LS_Achievement.GetKeyByUser(accountId))
					LS_Challenge.Copy(LS_Challenge.GetKeyByUser(previousUserId), LS_Challenge.GetKeyByUser(accountId))
					LS_Arcade.Copy(LS_Arcade.GetKeyByUser(previousUserId), LS_Arcade.GetKeyByUser(accountId))
					LS_Autosave.Copy(LS_Autosave.GetKeyByUserAndSlot(previousUserId), LS_Autosave.GetKeyByUserAndSlot(accountId))
					LS_Autosave.SetUserId(accountId)

					if LS_Autosave.IsReadable(accountId) then
						local retStr = Recorder.read(LS_Autosave.GetKey())

						if retStr and type(retStr) == "string" then
							FS_UserData.Reset()

							local val = json.decode(retStr)
							local saveInfo = LS_Autosave.Decode(val)

							if saveInfo then
								LS_Setting.SyncSaveSlotInfo(LS_Setting.IndexAutosave, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.utctime, saveInfo.gamemode, saveInfo.roundcount)
							end
						end
					end

					LS_Game.Copy(LS_Game.GetKeyByUserAndSlot(previousUserId, 1), LS_Game.GetKeyByUserAndSlot(accountId, 1))
					LS_Game.Copy(LS_Game.GetKeyByUserAndSlot(previousUserId, 2), LS_Game.GetKeyByUserAndSlot(accountId, 2))
					LS_Game.Copy(LS_Game.GetKeyByUserAndSlot(previousUserId, 3), LS_Game.GetKeyByUserAndSlot(accountId, 3))
					LS_Game.SetUserId(accountId)

					for slotIdx = 1, 3 do
						if LS_Game.IsReadable(accountId, slotIdx) then
							local retStr = Recorder.read(LS_Game.GetKey(slotIdx))

							if retStr and type(retStr) == "string" then
								FS_UserData.Reset()

								local val = json.decode(retStr)
								local saveInfo = LS_Game.Decode(val)

								if saveInfo then
									LS_Setting.SyncSaveSlotInfo(slotIdx, saveInfo.location, saveInfo.level, saveInfo.playtime, saveInfo.savetime, saveInfo.savetime, saveInfo.gamemode, saveInfo.roundcount)
								end
							end
						end
					end

					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetKeyByUserAndSlot(previousUserId, 1), LS_PlayerBehavior.GetKeyByUserAndSlot(accountId, 1))
					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetKeyByUserAndSlot(previousUserId, 2), LS_PlayerBehavior.GetKeyByUserAndSlot(accountId, 2))
					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetKeyByUserAndSlot(previousUserId, 3), LS_PlayerBehavior.GetKeyByUserAndSlot(accountId, 3))
					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(previousUserId, 1), LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(accountId, 1))
					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(previousUserId, 2), LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(accountId, 2))
					LS_PlayerBehavior.Copy(LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(previousUserId, 3), LS_PlayerBehavior.GetDeltaKeyByUserAndSlot(accountId, 3))
					LS_Achievement.Remove("1")
					LS_Challenge.Remove("1")
					LS_Arcade.Remove("1")
				end

				FS_UserData.Reset()
				LS_Setting.Update()
			end

			UIManager.SendMessage("LobbyMain", "RevalidateTitle")
			UIManager.SendMessage("LobbyMain", "RevalidateNewGame")
			UIManager.SendMessage("LobbyMain", "RevalidateLoadGame")
			UIManager.SendMessage("Setting", "UpdateRowAccount")
			UIManager.SendMessage("Setting", "SetUserId", accountId, loginType, nickname)
			UIManager.SendMessage("Setting", "ShowUserId", true)

			if SdkHelper.CheckAccountState() == true then
				NI_Login.SyncAchievement()
			end

			UIManager.RefreshLanguage()
		else
			SystemHelper.Log("[ ......Login failed: Invalid accountId ]")
		end
	else
		SystemHelper.Log("[ ......Login failed: " .. code .. " ]")
	end
end

function NI_Login.OnLogout(userId, loginType)
	SystemHelper.Log("[[[ NI_Login.OnLogOUT ]]]")
	LS_Account.SetPreviousUserId(userId)
	LS_Account.Reset()
	LS_Setting.Load("1")
	UIManager.SendMessage("Setting", "SetUserId", "1", -1)
	UIManager.SendMessage("Setting", "ShowUserId", true)
	LS_Achievement.SetUserId("1")
	LS_Achievement.Load("1")
	LS_Feedback.Load("1")
	LS_Challenge.SetUserId("1")
	LS_Challenge.Load("1")
	LS_Arcade.SetUserId("1")
	LS_Arcade.Load("1")
	LS_Autosave.SetUserId("1")
	LS_Game.SetUserId("1")
end

function NI_Login.SyncAchievement()
	SdkHelper.GetAchievement(function(result, jsonStr)
		if result == true then
			SystemHelper.Log("[ AchievementCtrl.GetAchievement: " .. tostring(result) .. ", json: " .. jsonStr)

			local retData = json.decode(jsonStr)

			if retData ~= nil then
				if retData.success then
					local resultString = retData.result.achievement .. tostring(retData.result.time) .. AppConst.SecKey
					local resultSign = Util.md5(resultString)

					if resultSign == retData.result.sign then
						SystemHelper.LogTest("=======成就回调签名验证通过=======")

						local utcTs, tsOffset = TimeHelper.getUtcTime()
						local time = utcTs

						if time - retData.result.time >= 600 then
							-- block empty
						else
							SystemHelper.LogTest("=======成就回调签名验证通过22=======")

							local userId = LS_Account.userId

							LS_Achievement.SetUserId(userId)

							local data = json.decode(retData.result.achievement)

							if data then
								LS_Achievement.SmartWrite(data.achievement)
							end
						end
					end
				elseif retData.code ~= 306 then
					-- block empty
				end
			end
		else
			UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_NETWORK_ERROR)
		end
	end)
end
