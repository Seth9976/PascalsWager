-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/SDK/SdkHelper.lua

require("LuaScript/SDK/IapData")

SdkHelper = class("SdkHelper")
SdkHelper.CHANNEL = "STEAM"
SdkHelper.GAME_ID = "1001"
SdkHelper.SERVER_URL = "https://pw.ztgame.com.cn/"
SdkHelper.ZONE_ID = 3
SdkHelper.GG_IOS_URL_TAB = {}
SdkHelper.GG_IOS_URL_TAB.us = "http://www.tips-works.com/gg_en.txt"
SdkHelper.GG_IOS_URL_TAB.zhs = "http://www.tips-works.com/gg_cn.txt"
SdkHelper.GG_IOS_URL_TAB.zht = "http://www.tips-works.com/gg_tw.txt"
SdkHelper.GG_IOS_URL_TAB.jp = "http://www.tips-works.com/gg_jp.txt"
SdkHelper.GG_IOS_URL_TAB.de = "http://www.tips-works.com/gg_de.txt"
SdkHelper.GG_IOS_URL_TAB.ru = "http://www.tips-works.com/gg_ru.txt"
SdkHelper.GG_IOS_URL_TAB.kr = "http://www.tips-works.com/gg_kr.txt"
SdkHelper.GG_IOS_URL_TAB.it = "http://www.tips-works.com/gg_it.txt"
SdkHelper.GG_IOS_URL_TAB.fr = "http://www.tips-works.com/gg_fr.txt"
SdkHelper.GG_IOS_URL_TAB.es = "http://www.tips-works.com/gg_es.txt"
SdkHelper.GG_IOS_URL_TAB.pt = "http://www.tips-works.com/gg_pt.txt"
SdkHelper.GG_TAPTAP_URL_TAB = {}
SdkHelper.GG_TAPTAP_URL_TAB.us = "http://www.tips-works.com/gg_taptap_en.txt"
SdkHelper.GG_TAPTAP_URL_TAB.zhs = "http://www.tips-works.com/gg_taptap_cn.txt"
SdkHelper.GG_TAPTAP_URL_TAB.zht = "http://www.tips-works.com/gg_taptap_tw.txt"
SdkHelper.GG_TAPTAP_URL_TAB.jp = "http://www.tips-works.com/gg_taptap_jp.txt"
SdkHelper.GG_TAPTAP_URL_TAB.de = "http://www.tips-works.com/gg_taptap_de.txt"
SdkHelper.GG_TAPTAP_URL_TAB.ru = "http://www.tips-works.com/gg_taptap_ru.txt"
SdkHelper.GG_TAPTAP_URL_TAB.kr = "http://www.tips-works.com/gg_taptap_kr.txt"
SdkHelper.GG_TAPTAP_URL_TAB.it = "http://www.tips-works.com/gg_taptap_it.txt"
SdkHelper.GG_TAPTAP_URL_TAB.fr = "http://www.tips-works.com/gg_taptap_fr.txt"
SdkHelper.GG_TAPTAP_URL_TAB.es = "http://www.tips-works.com/gg_taptap_es.txt"
SdkHelper.GG_TAPTAP_URL_TAB.pt = "http://www.tips-works.com/gg_taptap_pt.txt"
SdkHelper.GG_GOOGLE_URL_TAB = {}
SdkHelper.GG_GOOGLE_URL_TAB.us = "http://www.tips-works.com/gg_google_en.txt"
SdkHelper.GG_GOOGLE_URL_TAB.zhs = "http://www.tips-works.com/gg_google_cn.txt"
SdkHelper.GG_GOOGLE_URL_TAB.zht = "http://www.tips-works.com/gg_google_tw.txt"
SdkHelper.GG_GOOGLE_URL_TAB.jp = "http://www.tips-works.com/gg_google_jp.txt"
SdkHelper.GG_GOOGLE_URL_TAB.de = "http://www.tips-works.com/gg_google_de.txt"
SdkHelper.GG_GOOGLE_URL_TAB.ru = "http://www.tips-works.com/gg_google_ru.txt"
SdkHelper.GG_GOOGLE_URL_TAB.kr = "http://www.tips-works.com/gg_google_kr.txt"
SdkHelper.GG_GOOGLE_URL_TAB.it = "http://www.tips-works.com/gg_google_it.txt"
SdkHelper.GG_GOOGLE_URL_TAB.fr = "http://www.tips-works.com/gg_google_fr.txt"
SdkHelper.GG_GOOGLE_URL_TAB.es = "http://www.tips-works.com/gg_google_es.txt"
SdkHelper.GG_GOOGLE_URL_TAB.pt = "http://www.tips-works.com/gg_google_pt.txt"
SdkHelper.REFRESH_INTERVAL = 500
SdkHelper.isSdkInited = false
SdkHelper.isLogined = false
SdkHelper.SessionId = nil
SdkHelper.Token = nil
SdkHelper.SdkFacade = nil
SdkHelper.AppleSignFacade = nil
SdkHelper.AccountType = 0
SdkHelper.OnSdkLoginedCallback = nil
SdkHelper.OnSdkInitedCallback = nil
SdkHelper.OnSdkLogoutCallback = nil
SdkHelper.OnSdkCheckLicenseCallback = nil
SdkHelper.NeedRealNameAuth = DebugOpenAntiAddiction
SdkHelper.NeedSDK = true
SdkHelper.Region = ""
SdkHelper.IapInfos = {}
SdkHelper.IsIapInfosInited = false
SdkHelper.OnGetIapInfosCallback = nil
SdkHelper.IsPaidListInited = false
SdkHelper.OnGetPaidListCallback = nil
SdkHelper.OnCheckPayCallback = nil
SdkHelper.InitResCode = 0
SdkHelper.lastRefreshSessionTime = nil
SdkHelper.realNameZone = false

function SdkHelper.TestHenry()
	networkMgrHttp:DoGet("http://ip-api.com/json/?lang=zh-CN", function(result, jsonData)
		return
	end)
end

function SdkHelper.CheckIP(callback)
	networkMgrHttp:DoGet("http://ip-api.com/json/?lang=zh-CN", callback)
end

function SdkHelper.CheckIfNeedRealName(callback)
	local sysLang = Device.getSysLang()
	local getIpSuccess = false

	SdkHelper.realNameZone = false

	if callback ~= nil then
		callback(SdkHelper.realNameZone)
	end
end

function SdkHelper.CheckAccountState()
	return SdkHelper.IsInited() and SdkHelper.IsSdkLogined()
end

function SdkHelper.IsInited()
	if SdkHelper.SdkFacade ~= nil then
		return SdkHelper.SdkFacade:IsInited()
	end

	return false
end

function SdkHelper.IsSdkLogined()
	if SdkHelper.SdkFacade ~= nil then
		return SdkHelper.SdkFacade:IsLogined()
	end

	return false
end

function SdkHelper.InitSdk(callback)
	SystemHelper.LogTest("-------------------- SdkHelper.InitSdk --------------------")

	if SdkHelper.NeedSDK == false then
		if callback ~= nil then
			callback(false)
		end
	elseif SdkHelper.isSdkInited == false then
		SdkHelper.ClearAll()

		SdkHelper.REFRESH_INTERVAL = 500

		SystemHelper.LogTest("-------------------- SdkHelper.InitSdk2 --------------------")

		SdkHelper.OnSdkInitedCallback = callback
		SdkHelper.SdkFacade = SDKFacade.Instance
		SdkHelper.SdkFacade.OnInitHandler = SdkHelper.OnInitHandler
		SdkHelper.SdkFacade.OnLoginHandler = SdkHelper.OnLoginHandler
		SdkHelper.SdkFacade.OnLogoutHandler = SdkHelper.OnLogoutHandler
		SdkHelper.SdkFacade.OnOfflineLoginHandler = SdkHelper.OnOfflineLoginHandler
		SdkHelper.SdkFacade.OnCallFunctionComplete = SdkHelper.OnCallFunctionComplete
		SdkHelper.SdkFacade.OnPayHandler = SdkHelper.OnPayHandler
		SdkHelper.SdkFacade.OnCheckLicenseByNet = SdkHelper.OnCheckLicenseByNet

		if SdkHelper.SdkFacade ~= nil then
			SystemHelper.LogTest(" SdkHelper.SdkFacade Init()")
			SdkHelper.SdkFacade:Init()
		end
	elseif callback ~= nil then
		callback(true)
	end
end

function SdkHelper.ClearAll()
	SdkHelper.isSdkInited = false
	SdkHelper.isLogined = false
	SdkHelper.SessionId = nil
	SdkHelper.Token = nil
	SdkHelper.SdkFacade = nil
	SdkHelper.OnSdkLoginedCallback = nil
	SdkHelper.REFRESH_INTERVAL = 500
	SdkHelper.lastRefreshSessionTime = os.time()
	SdkHelper.Region = ""
end

function SdkHelper.LoginGuest(callback)
	SystemHelper.Log("-------------------- SdkHelper.LoginGuest --------------------")

	SdkHelper.OnSdkLoginedCallback = callback

	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SdkHelper.SdkFacade:LoginGuest()
		else
			SystemHelper.LogTest("Sdk is not inited!!")

			if callback ~= nil then
				callback(false, 0, 0, 0)
			end

			SdkHelper.OnSdkLoginedCallback = nil
		end
	else
		SystemHelper.LogTest("Sdk is null")

		if callback ~= nil then
			callback(false, 0, 0, 0)
		end

		SdkHelper.OnSdkLoginedCallback = nil
	end
end

function SdkHelper.Login3rd(loginType, callback)
	SystemHelper.LogTest("-------------------- SdkHelper.Login3rd --------------------")

	SdkHelper.OnSdkLoginedCallback = callback

	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SdkHelper.SdkFacade:Login3rd(loginType)
		else
			SystemHelper.LogTest("Sdk is not inited!!")

			if callback ~= nil then
				callback(false, 0, 0, 0)
			end

			SdkHelper.OnSdkLoginedCallback = nil
		end
	else
		SystemHelper.LogTest("Sdk is null")

		if callback ~= nil then
			callback(false, 0, 0, 0)
		end

		SdkHelper.OnSdkLoginedCallback = nil
	end
end

function SdkHelper.Bind3rd(loginType, callback)
	SystemHelper.LogTest("-------------------- SdkHelper.Bind3rd --------------------")

	SdkHelper.OnSdkLoginedCallback = callback

	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SdkHelper.SdkFacade:Bind3rd(loginType)
		else
			SystemHelper.LogTest("Sdk is not inited!!")

			if callback ~= nil then
				callback(false, 0, 0, 0)
			end

			SdkHelper.OnSdkLoginedCallback = nil
		end
	else
		SystemHelper.LogTest("Sdk is null")

		if callback ~= nil then
			callback(false, 0, 0, 0)
		end

		SdkHelper.OnSdkLoginedCallback = nil
	end
end

function SdkHelper.LoginAccountServer(jsonText, callback)
	if AppConst.SdkType == "GIANT" then
		SdkHelper.loginByGiant(jsonText, callback)
	else
		SdkHelper.loginByTipsWorks(callback)
	end
end

function SdkHelper.GetUserAge()
	SystemHelper.LogTest("SdkHelper.AccountType:" .. SdkHelper.AccountType)

	if SdkHelper.realNameZone == false then
		return 16
	end

	if bit.band(SdkHelper.AccountType, 16) == 16 then
		SystemHelper.LogTest("已成年")

		return 16
	elseif bit.band(SdkHelper.AccountType, 512) == 512 then
		SystemHelper.LogTest("已实名认证")

		return 1
	end

	SystemHelper.LogTest("SdkHelper.GetUserAge(): return 0")

	return 0
end

function SdkHelper.CallRealNameAuth(callback)
	SystemHelper.LogTest("SdkHelper.CallRealNameAuth")

	if SdkHelper.NeedRealNameAuth == true and SdkHelper.realNameZone == true and bit.band(SdkHelper.AccountType, 512) ~= 512 then
		if SdkHelper.SdkFacade ~= nil then
			SystemHelper.LogTest("SdkHelper.CallRealNameAuth  have to call")

			SdkHelper.OnSdkLoginedCallback = callback

			SdkHelper.SdkFacade:RealNameAuth()
		else
			SystemHelper.LogTest("SdkHelper.CallRealNameAuth  SdkHelper.SdkFacade == null")

			if callback ~= nil then
				callback(true, "")
			end
		end
	elseif callback ~= nil then
		callback(true, "")
	end
end

function SdkHelper.loginByGiant(jsonText, callback)
	SystemHelper.LogTest("SdkHelper.loginByGiant")

	local loginData = json.decode(jsonText)

	if loginData ~= nil then
		local devType = Common.GetDeviceType()

		if devType == nil then
			devType = ""
		end

		local devId = ""

		if loginData.device_udid ~= nil then
			devId = loginData.device_udid
		end

		SdkHelper.AccountType = loginData.entity.account_type

		SystemHelper.LogTest("SdkHelper.AccountType:" .. tostring(SdkHelper.AccountType))
		SystemHelper.LogTest("openId:" .. loginData.entity.openid)
		SystemHelper.LogTest("accountType:" .. loginData.entity.account_type)
		SystemHelper.LogTest("type:" .. loginData.entity.type)
		SystemHelper.LogTest("account:" .. loginData.entity.account)
		SystemHelper.LogTest("time:" .. loginData.entity.time)
		SystemHelper.LogTest("sign:" .. loginData.sign)
		SystemHelper.LogTest("device_type:" .. devType)
		SystemHelper.LogTest("devId:" .. devId)
		SystemHelper.LogTest("SdkHelper.Region:" .. SdkHelper.Region)

		local signStr = SdkHelper.CHANNEL .. loginData.entity.openid .. devId .. devType .. SdkHelper.GAME_ID .. AppConst.SecKey

		SystemHelper.LogTest("signStr:" .. signStr)

		local sign = Util.md5(signStr)
		local paramList = {
			channel = SdkHelper.CHANNEL,
			gameId = SdkHelper.GAME_ID,
			openId = loginData.entity.openid,
			accountType = loginData.entity.account_type,
			type = loginData.entity.type,
			account = loginData.entity.account,
			time = tostring(loginData.entity.time),
			sign = loginData.sign,
			deviceType = devType,
			deviceId = devId,
			loginSign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "loginByGiant", paramList, callback)
	elseif callback ~= nil then
		callback(false, "")
	end
end

function SdkHelper.loginByTipsWorks(callback)
	SystemHelper.LogTest("SdkHelper.loginByTipsWorks")

	local deviceId = AppConst.deviceId
	local deviceType = Common.GetDeviceType()

	if deviceType == nil then
		deviceType = ""
	end

	local utcTs, tsOffset = TimeHelper.getUtcTime()
	local time = utcTs
	local sign = Util.md5(SdkHelper.CHANNEL .. deviceId .. deviceType .. SdkHelper.GAME_ID .. tostring(time) .. AppConst.SecKey)

	SystemHelper.LogTest("deviceId:" .. deviceId)
	SystemHelper.LogTest("deviceType:" .. deviceType)
	SystemHelper.LogTest("time:" .. time)
	SystemHelper.LogTest("sign:" .. sign)

	local paramList = {
		channel = SdkHelper.CHANNEL,
		deviceId = deviceId,
		deviceType = deviceType,
		gameId = SdkHelper.GAME_ID,
		time = tostring(time),
		loginSign = sign
	}

	networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "loginByTipsWorks", paramList, callback)
end

function SdkHelper.clientLog(logData, callback)
	SystemHelper.LogTest("SdkHelper.clientLog")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local sessionId = SdkHelper.SessionId
		local log = logData
		local sign = Util.md5(sessionId .. log .. AppConst.SecKey)

		SystemHelper.LogTest("sessionId:" .. sessionId)
		SystemHelper.LogTest("log:" .. log)
		SystemHelper.LogTest("sign:" .. sign)

		local paramList = {
			sessionId = sessionId,
			log = log,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "clientLog", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.clientLog failed. isLogined == false or sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.refreshSession()
	if SdkHelper.SessionId ~= nil then
		local tim = os.time()

		if SdkHelper.lastRefreshSessionTime == nil or tim - SdkHelper.lastRefreshSessionTime >= SdkHelper.REFRESH_INTERVAL then
			SdkHelper.lastRefreshSessionTime = tim

			SystemHelper.LogTest("SdkHelper.refreshSession")

			local paramList = {
				sessionId = SdkHelper.SessionId,
				token = SdkHelper.Token
			}

			networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "sessionRefresh", paramList, function(result, jsonText)
				SystemHelper.LogTest(jsonText)

				if result == true and jsonText ~= nil then
					local resultData = json.decode(jsonText)

					if resultData ~= nil and resultData.success == true then
						SdkHelper.SessionId = resultData.result.id
						SdkHelper.Token = resultData.result.token
					else
						if resultData.code == 109 then
							-- block empty
						end

						SystemHelper.LogTest("sessionRefresh success = false")
					end
				else
					SystemHelper.LogTest("sessionRefresh failed!")
				end
			end)
		end
	end
end

function SdkHelper.OnCallFunctionComplete(retCode, jsonStr)
	SystemHelper.LogTest("#########################################SdkHelper.OnCallFunctionComplete retCode:" .. retCode .. "  json:" .. jsonStr)

	local retData = json.decode(jsonStr)

	if retData ~= nil then
		if retData.type == "webClose" then
			if retData.msg.webType == "idcard-auth" then
				SystemHelper.LogTest("没有完成实名认证!!!")

				if SdkHelper.OnSdkLoginedCallback ~= nil then
					SdkHelper.OnSdkLoginedCallback(false, "{}")
				end
			end
		elseif retData.type == "skuDetails" then
			SdkHelper.OnSkuDetails(retData)
		elseif retData.type == "paidList" then
			SdkHelper.OnPaidList(retData)
		end
	elseif SdkHelper.OnSdkLoginedCallback ~= nil then
		SdkHelper.OnSdkLoginedCallback(false, "{}")
	end
end

function SdkHelper.OnSkuDetails(retData)
	SystemHelper.LogTest("获取内购商品详细信息")

	SdkHelper.IapInfos = {}
	SdkHelper.IsIapInfosInited = false

	local channelIapData = IapData[SdkHelper.CHANNEL]

	if channelIapData ~= nil then
		for k, v in pairs(channelIapData) do
			local netIapItem = {
				valid = true,
				paid = false,
				id = v.id,
				productId = k,
				order = v.order,
				tier = v.tier,
				price = v.price,
				actualPrice = v.actualPrice,
				currency = v.currency,
				sell = v.sell,
				oldPrice = v.oldPrice,
				discount = v.discount
			}

			SdkHelper.IapInfos[k] = netIapItem
		end
	end

	for i = 1, #retData.msg.skus do
		local iapItem = retData.msg.skus[i]

		if type(iapItem) == "string" then
			SystemHelper.LogTest("productId:" .. iapItem)

			local localIapDataItem = SdkHelper.IapInfos[iapItem]

			if localIapDataItem ~= nil then
				SystemHelper.LogTest("netIapItem:" .. localIapDataItem.productId .. " " .. localIapDataItem.id .. " " .. localIapDataItem.price .. " " .. localIapDataItem.currency)
			end
		else
			SystemHelper.LogTest("productId:" .. iapItem.productId)

			local localIapDataItem = SdkHelper.IapInfos[iapItem.productId]

			if localIapDataItem ~= nil then
				print_r(localIapDataItem)
				SystemHelper.LogTest("localIapDataItem:" .. localIapDataItem.id)

				local price_currency_code = string.split(iapItem.price_currency_code, "=")
				local currencyCode = price_currency_code[2]

				if currencyCode == nil then
					currencyCode = iapItem.price_currency_code
				end

				localIapDataItem.price = iapItem.price
				localIapDataItem.currency = currencyCode

				SystemHelper.LogTest("netIapItem:" .. localIapDataItem.productId .. " " .. localIapDataItem.id .. " " .. localIapDataItem.price .. " " .. localIapDataItem.currency)
			end
		end
	end

	SdkHelper.IsIapInfosInited = true

	if SdkHelper.OnGetIapInfosCallback ~= nil then
		SdkHelper.OnGetIapInfosCallback(true)

		SdkHelper.OnGetIapInfosCallback = nil
	end
end

function SdkHelper.OnPaidList(retData)
	for i = 1, #retData.msg.productId do
		local pId = retData.msg.productId[i]

		SystemHelper.LogTest("已购买的追加内容ID:" .. pId)

		if SdkHelper.IapInfos[pId] ~= nil then
			SdkHelper.IapInfos[pId].valid = true
		end
	end

	SystemHelper.LogTest("In OnGetPaidListCallback ")

	SdkHelper.IsPaidListInited = true

	if SdkHelper.OnGetPaidListCallback ~= nil then
		SystemHelper.LogTest("In OnGetPaidListCallback ")
		SdkHelper.OnGetPaidListCallback(true)

		SdkHelper.OnGetPaidListCallback = nil
	end

	SystemHelper.LogTest("OnPaidList Over ")
end

function SdkHelper.OnCheckLicenseByNet(retCode, jsonStr)
	SystemHelper.LogTest("#############################################SdkHelper.OnCheckLicenseByNet retCode:" .. retCode .. " json:" .. jsonStr)

	local jsonObj = json.decode(jsonStr)

	if retCode == 0 then
		if jsonObj.msg.code == 0 then
			local signData = jsonObj.msg.result.signedData
			local checkId = tostring(StringHelper.Split(signData, "|")[2])
			local sessionId = StringHelper.Substring(tostring(SdkHelper.SessionId), 1, 9)

			if checkId == sessionId then
				if SdkHelper.OnSdkCheckLicenseCallback ~= nil then
					SdkHelper.OnSdkCheckLicenseCallback()

					SdkHelper.OnSdkCheckLicenseCallback = nil
				end
			else
				UIManager.SendMessage("Loading", "SimpleLoading", false)
				MsgBoxSimpleCtrl.CloseMessage()
				UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.ERR_SIGNATURE_VERIFICATION_FAILED, function()
					UnityEngine.Application.Quit()
				end, function()
					return
				end, true)
			end
		elseif jsonObj.msg.code == 1 then
			UIManager.SendMessage("Loading", "SimpleLoading", false)
			MsgBoxSimpleCtrl.CloseMessage()
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.ERR_MSG_CODE0, function()
				SdkHelper.SdkFacade:CheckLicenseByNet(tostring(SdkHelper.SessionId))
				UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
				MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
			end, function()
				return
			end, true)
		else
			MsgBoxSimpleCtrl.CloseMessage()
			UIManager.SendMessage("Loading", "SimpleLoading", false)
			UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.ERR_GOOGLE_ACCOUNT_LOGIN_REQUIRED, function()
				SdkHelper.SdkFacade:CheckLicenseByNet(tostring(SdkHelper.SessionId))
				UIManager.SendMessage("Loading", "SimpleLoading", true, true, true)
				MsgBoxSimpleCtrl.OpenMassageBox(GameText.UI_EVENTLOG_GETIAP_SUCC)
			end, function()
				return
			end, true)
		end
	elseif retCode == 911 then
		UIManager.SendMessage("Loading", "SimpleLoading", false)
		MsgBoxSimpleCtrl.CloseMessage()
		UIManager.SendMessage("MsgBoxSimple", "OpenConfirmAndCancel", GameText.ERR_SIGNATURE_VERIFICATION_FAILED, function()
			UnityEngine.Application.Quit()
		end, function()
			return
		end, true)
	elseif SdkHelper.OnSdkCheckLicenseCallback ~= nil then
		SdkHelper.OnSdkCheckLicenseCallback()

		SdkHelper.OnSdkCheckLicenseCallback = nil
	end
end

function SdkHelper.OnPayHandler(retCode, jsonStr)
	SystemHelper.LogTest("#############################################SdkHelper.OnPayHandler retCode:" .. retCode .. " json:" .. jsonStr)

	local jsonObj = json.decode(jsonStr)
	local paramList

	if retCode == 0 then
		local orderItem = {
			priceTier = 0,
			productId = jsonObj.product_id,
			orderId = jsonObj.order_id,
			transactionId = jsonObj.transaction_id
		}
		local orderItemStr = json.encode(orderItem)
		local signStr = tostring(SdkHelper.SessionId) .. orderItemStr .. AppConst.SecKey
		local sign = Util.md5(signStr)

		paramList = {
			sessionId = SdkHelper.SessionId,
			product = orderItemStr,
			sign = sign
		}

		SystemHelper.LogTest("aaaa:" .. tostring(jsonObj.product_id))

		if SdkHelper.IapInfos[jsonObj.product_id] ~= nil then
			SdkHelper.IapInfos[jsonObj.product_id].paid = true
			SdkHelper.IapInfos[jsonObj.product_id].valid = true

			if SdkHelper.IapInfos[jsonObj.product_id].id == "dlcmaze1" then
				IapData.DLC_MAZE_1 = true
			end

			if SdkHelper.IapInfos[jsonObj.product_id].id == "dlcstory1" then
				IapData.DLC_TIDE_1 = true
			end

			if SdkHelper.IapInfos[jsonObj.product_id].id == "dlcarcade" then
				IapData.DLC_ARCADE = true
			end

			if SdkHelper.IapInfos[jsonObj.product_id].id == "hero11007" then
				IapData.DLC_ELENA = true
			end
		else
			SystemHelper.LogTest("商品信息没初始化")
		end

		if SdkHelper.OnCheckPayCallback ~= nil then
			SdkHelper.OnCheckPayCallback(true, nil)

			SdkHelper.OnCheckPayCallback = nil
		end
	elseif SdkHelper.OnCheckPayCallback ~= nil then
		SdkHelper.OnCheckPayCallback(false, nil)

		SdkHelper.OnCheckPayCallback = nil
	end

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil and paramList ~= nil then
		SystemHelper.LogTest("call payPascalProduct:")
		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "payPascalProduct", paramList, function(success, buyResultJson)
			SystemHelper.LogTest("payPascalProduct:" .. tostring(success) .. buyResultJson)
		end)
	end
end

function SdkHelper.OnInitHandler(retCode)
	SystemHelper.LogTest("#############################################SdkHelper.OnInitHandler retCode:" .. retCode)

	SdkHelper.isSdkInited = true

	if retCode == 0 then
		SdkHelper.InitResCode = 0

		if SdkHelper.OnSdkInitedCallback ~= nil then
			SdkHelper.OnSdkInitedCallback(true)
		end
	else
		SdkHelper.InitResCode = retCode

		if SdkHelper.OnSdkInitedCallback ~= nil then
			SdkHelper.OnSdkInitedCallback(false)
		end
	end
end

function SdkHelper.OnLogoutHandler(retCode)
	SystemHelper.LogTest("SdkHelper.OnLogoutHandler retCode:" .. retCode)

	SdkHelper.isLogined = false
	SdkHelper.SessionId = nil
	SdkHelper.Token = nil

	if SdkHelper.OnSdkLogoutCallback ~= nil then
		SdkHelper.OnSdkLogoutCallback(true)
	end
end

function SdkHelper.OnLoginAccountServerCallback(result, jsonStr)
	SystemHelper.LogTest("OnLoginAccountServer result:" .. tostring(result) .. " json:" .. jsonStr)

	if result == true then
		local loginData = json.decode(jsonStr)

		if loginData ~= nil then
			SystemHelper.LogTest("success:" .. tostring(loginData.success))

			if loginData.success == true then
				local strAccId = loginData.result.accountId

				SystemHelper.LogTest("loginData.result.accountId:" .. strAccId)

				local resultString = loginData.result.type .. loginData.result.nickName .. strAccId .. loginData.result.channel .. loginData.result.platform .. loginData.result.platformId .. loginData.result.appleSignId .. loginData.result.params .. tostring(loginData.result.time) .. AppConst.SecKey

				SystemHelper.LogTest("resultString:" .. resultString)

				local resultSign = Util.md5(resultString)

				SystemHelper.LogTest("resultSign:" .. resultSign)
				SystemHelper.LogTest("sign:" .. loginData.result.sign)

				if loginData.params ~= nil then
					local paramsJson = json.decode(loginData.params)

					if paramsJson ~= nil then
						if paramsJson.debug == true then
							DebugOpenFeedback = true
						else
							DebugOpenFeedback = false
						end
					end
				end

				if resultSign == loginData.result.sign then
					SystemHelper.LogTest("=======登录回调签名验证通过=======")

					local utcTs, tsOffset = TimeHelper.getUtcTime()
					local time = utcTs

					if time - loginData.result.time >= 600 then
						SystemHelper.LogTest("=======session 超时=======")
					else
						SystemHelper.LogTest("=======登录回调签名验证通过22=======")

						SdkHelper.lastRefreshSessionTime = os.time()
						SdkHelper.SessionId = loginData.result.id
						SdkHelper.Token = loginData.result.token

						SystemHelper.LogTest("SessionId:" .. SdkHelper.SessionId)
						SystemHelper.LogTest("accountToken:" .. SdkHelper.Token)

						SdkHelper.isLogined = true

						SdkHelper.OnSdkCheckLicense(function()
							local ldata = loginData

							SystemHelper.LogTest("OnSdkCheckLicense 验证成功")

							if SdkHelper.OnSdkLoginedCallback ~= nil then
								SdkHelper.OnSdkLoginedCallback(ldata.success, ldata.code, ldata.result.accountId, ldata.result.type, ldata.result.nickName)

								SdkHelper.OnSdkLoginedCallback = nil

								local userNickName = SdkHelper.SdkFacade:GetUserName()

								if userNickName ~= "" and ldata.nickName ~= userNickName then
									SdkHelper.SetNickname(userNickName, nil)
								end
							end
						end)
					end
				else
					SdkHelper.isLogined = false

					if SdkHelper.OnSdkLoginedCallback ~= nil then
						SdkHelper.OnSdkLoginedCallback(loginData.success, loginData.code, 0, 0, "")

						SdkHelper.OnSdkLoginedCallback = nil
					end

					SystemHelper.LogTest("登录返回数据签名验证未通过！")
				end
			elseif SdkHelper.OnSdkLoginedCallback ~= nil then
				SdkHelper.OnSdkLoginedCallback(false, loginData.code, 0, 0, "")

				SdkHelper.OnSdkLoginedCallback = nil
			end
		elseif SdkHelper.OnSdkLoginedCallback ~= nil then
			SdkHelper.OnSdkLoginedCallback(false, 0, 0, 0, "")

			SdkHelper.OnSdkLoginedCallback = nil
		end
	else
		SystemHelper.LogError("网络问题导致登录失败")

		if SdkHelper.OnSdkLoginedCallback ~= nil then
			SdkHelper.OnSdkLoginedCallback(false, 0, 0, 0, "")

			SdkHelper.OnSdkLoginedCallback = nil
		end

		SystemHelper.LogTest("网络问题导致登录失败")
	end
end

function SdkHelper.OnLoginHandler(retCode, jsonStr)
	SystemHelper.LogError("#########################################SdkHelper.OnLoginHandler retCode:" .. retCode .. "  json:" .. jsonStr)

	if retCode == 0 then
		SdkHelper.LoginAccountServer(jsonStr, SdkHelper.OnLoginAccountServerCallback)
	elseif SdkHelper.OnLoginAccountServerCallback ~= nil then
		SdkHelper.OnLoginAccountServerCallback(false, "")
	end
end

function SdkHelper.FakeLoginAccountServer()
	if SdkHelper.OnLoginAccountServerCallback ~= nil then
		SdkHelper.OnLoginAccountServerCallback(true, "")
	end
end

function SdkHelper.OnSdkCheckLicense(callback)
	function SdkHelper.OnSdkCheckLicenseCallback()
		callback()
	end

	SdkHelper.SdkFacade:CheckLicenseByNet(tostring(SdkHelper.SessionId))
end

function SdkHelper.OnOfflineLoginHandler()
	SystemHelper.LogTest("SdkHelper.OnOfflineLoginHandler")
end

function SdkHelper.OnAppleLoginHandler(result, jwtStr)
	SystemHelper.LogTest("OnAppleLoginHandler result" .. tostring(result) .. "  jwtStr:" .. jwtStr)

	if result == true then
		local deviceId = AppConst.deviceId
		local deviceType = Common.GetDeviceType()

		if deviceType == nil then
			deviceType = ""
		end

		local utcTs, tsOffset = TimeHelper.getUtcTime()
		local time = utcTs
		local sign = Util.md5(SdkHelper.CHANNEL .. deviceId .. deviceType .. jwtStr .. SdkHelper.GAME_ID .. tostring(time) .. AppConst.SecKey)

		SystemHelper.LogTest("deviceId:" .. deviceId)
		SystemHelper.LogTest("deviceType:" .. deviceType)
		SystemHelper.LogTest("time:" .. time)
		SystemHelper.LogTest("sign:" .. sign)

		local paramList = {
			channel = SdkHelper.CHANNEL,
			deviceId = deviceId,
			deviceType = deviceType,
			jwt = jwtStr,
			gameId = SdkHelper.GAME_ID,
			time = tostring(time),
			loginSign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "loginByAppleSign", paramList, function(result, jsonStr)
			SystemHelper.LogTest("loginByAppleSign result == " .. tostring(result) .. " jsonStr:" .. jsonStr)

			if result == true then
				local jsonResult = json.decode(jsonStr)

				if jsonResult == nil or jsonResult.success == true then
					-- block empty
				elseif jsonResult.code == 113 then
					-- block empty
				end
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.OnAppleLoginHandler failed. result == false")
	end
end

function SdkHelper.BindSignInWithApple()
	return
end

function SdkHelper.SaveDataToServer(dataIndex, desc, version, data, achievement, stamp, callback)
	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. tostring(dataIndex) .. desc .. data .. version .. achievement .. stamp .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			sessionId = SdkHelper.SessionId,
			index = dataIndex,
			tips = desc,
			version = version,
			archive = data,
			achievement = achievement,
			stamp = stamp,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "setArchive", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.SaveDataToServer failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetSaveDataList(callback)
	SystemHelper.LogTest("GetSaveDataList")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getArchiveTips", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.GetSaveDataList failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetSaveData(dataIndex, version, callback)
	SystemHelper.LogTest("GetSaveData")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId,
			index = dataIndex,
			version = version
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getArchive", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.GetSaveData failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.SaveAllDataToServer(achievement, archives, setting, version, stamp, callback)
	SystemHelper.LogError("SaveAllDataToServer   SdkHelper.isLogined:" .. tostring(SdkHelper.isLogined) .. "  SdkHelper.SessionId:" .. tostring(SdkHelper.SessionId))

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. archives .. version .. setting .. achievement .. stamp .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			sessionId = SdkHelper.SessionId,
			version = version,
			achievement = achievement,
			archives = archives,
			setting = setting,
			stamp = stamp,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "setAllArchive", paramList, callback)
	elseif callback ~= nil then
		callback(false, nil)
	end
end

function SdkHelper.GetAllDataFromServer(version, callback)
	SystemHelper.LogTest("#############################################GetAllDataFromServer version:" .. version)

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId,
			version = version
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getAllArchive", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.GetAllDataFromServer failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.Destory()
	if SdkHelper.AppleSignFacade ~= nil then
		SdkHelper.AppleSignFacade:Destory()
	end

	if SdkHelper.SdkFacade ~= nil then
		SdkHelper.SdkFacade:Destory()
	end
end

function SdkHelper.Logout(callback)
	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.SdkFacade:IsLogined() == true then
			SdkHelper.OnSdkLogoutCallback = callback

			SdkHelper.SdkFacade:Logout()
		elseif callback ~= nil then
			callback(false)
		end
	end
end

function SdkHelper.SetFeedback(type, content, callback)
	SystemHelper.LogTest("#############################################SetFeedback")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId,
			content = content,
			type = type
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "setFeedback", paramList, function(result, jsonStr)
			SystemHelper.LogTest("SetFeedback result:" .. tostring(result) .. "  json:" .. jsonStr .. "content:" .. content)

			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							if content == "reqdebugon" then
								DebugShow = true
								DebugLog = true
								DebugDontDeadSelf = true
								DebugDamageUpSelf = true
								DebugFly = true
								DebugShowUnitInfo = true
								DebugShowCtrlPanel = true
								LobbyMainCfg.LobbyRoot = {
									{
										"Continue",
										"LobbyMain_Root_NavBtn_Continue",
										"OnButtonStoryModeContinue"
									},
									{
										"Load",
										"LobbyMain_Root_NavBtn_Load",
										"OnButtonStoryModeLoad"
									},
									{
										"Story",
										"LobbyMain_Root_NavBtn_Story",
										"OnButtonStoryModeStart"
									},
									{
										"Level",
										"LobbyMain_Root_NavBtn_Level",
										"OnButtonLevelMode"
									},
									{
										"Boss",
										"LobbyMain_Root_NavBtn_Boss",
										"OnButtonBossMode"
									},
									{
										"Challenge",
										"LobbyMain_Root_NavBtn_Challenge",
										"OnButtonChallengeMode"
									},
									{
										"Maze",
										"LobbyMain_Root_NavBtn_Maze",
										"OnButtonMazeMode"
									},
									{
										"Carriage",
										"LobbyMain_Root_NavBtn_Carriage",
										"OnButtonCarriageStart"
									},
									{
										"DLCs",
										"LobbyMain_Root_NavBtn_DLCs",
										"OnButtonDLCs"
									},
									{
										"Achievement",
										"LobbyMain_Root_NavBtn_Achievement",
										"OnButtonAchievement"
									},
									{
										"Local",
										"LobbyMain_Root_NavBtn_Local",
										"OnButtonFreeModeLocal"
									},
									{
										"Settings",
										"LobbyMain_Root_NavBtn_Settings",
										"OnButtonSettings"
									},
									{
										"Quit",
										"LobbyMain_Root_NavBtn_QuitGame",
										"OnButtonQuitGame"
									}
								}
							end

							if callback ~= nil then
								callback(true, 0, resultData.result)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, 0)
					end
				elseif callback ~= nil then
					callback(false, 0)
				end
			elseif callback ~= nil then
				callback(false, 0)
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.SetFeedback failed. sessionId == nil")

		if callback ~= nil then
			callback(false, 0)
		end
	end
end

function SdkHelper.GetFeedback(callback)
	SystemHelper.LogTest("#############################################SetFeedback")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getFeedback", paramList, function(result, jsonStr)
			SystemHelper.LogTest("GetFeedback result:" .. tostring(result) .. "  json:" .. jsonStr)

			if result == true then
				if callback ~= nil then
					callback(true, jsonStr)
				end
			elseif callback ~= nil then
				callback(false, 0)
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.GetFeedback failed. sessionId == nil")

		if callback ~= nil then
			callback(false, 0, nil)
		end
	end
end

function SdkHelper.SetAchievement(achievement, callback)
	SystemHelper.LogTest("##################################################SetAchievement archievement:" .. achievement)

	local data = json.decode(achievement)
	local achdata = ""

	for i = 1, #data.achievement.achievement_finish do
		local pId = data.achievement.achievement_finish[i]

		achdata = achdata .. "," .. pId
	end

	if SdkHelper.SdkFacade ~= nil and SdkHelper.IsInited() == true then
		SdkHelper.SdkFacade:setAchievement(achdata)
		SystemHelper.LogTest(" id : " .. achdata)
	end

	if callback ~= nil then
		callback(true, 0)
	end
end

function SdkHelper.GetAchievement(callback)
	SystemHelper.LogTest("GetAchievement")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getAchievement", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.GetAchievement failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetAchievementTime(callback)
	SystemHelper.LogTest("GetAchievementTime")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getArchiveTime", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.GetAchievementTime failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.SetNickname(nickname, callback)
	SystemHelper.LogTest("SetNickname")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId,
			nickName = nickname
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "bindNickName", paramList, function(result, jsonStr)
			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							if callback ~= nil then
								callback(true, 0, resultData.result)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, 0)
					end
				elseif callback ~= nil then
					callback(false, 0)
				end
			elseif callback ~= nil then
				callback(false, 0)
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.SetNickname failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.SetRankInfo(content, callback)
	SystemHelper.LogTest("SetNickname")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. content .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			content = content,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "setRankInfo", paramList, function(result, jsonStr)
			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							if callback ~= nil then
								callback(true, 0, resultData.result)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, 0)
					end
				elseif callback ~= nil then
					callback(false, 0)
				end
			elseif callback ~= nil then
				callback(false, 0)
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.setRankInfo failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetRankInfo(callback)
	SystemHelper.LogTest("GetRankInfo")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getRankInfo", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.getRankInfo failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetRankList(rankType, callback)
	SystemHelper.LogTest("GetRankList")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. rankType .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			type = rankType,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getRankList", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.getRankList failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.SetArcadeRankInfo(content, callback)
	SystemHelper.LogTest("SetArcadeRankInfo")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. content .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			content = content,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "setArcadeRankInfo", paramList, function(result, jsonStr)
			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							if callback ~= nil then
								callback(true, 0, resultData.result)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, 0)
					end
				elseif callback ~= nil then
					callback(false, 0)
				end
			elseif callback ~= nil then
				callback(false, 0)
			end
		end)
	else
		SystemHelper.LogTest("SdkHelper.setArcadeRankInfo failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetArcadeRankList(rankType, callback)
	SystemHelper.LogTest("GetArcadeRankList")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. rankType .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			type = rankType,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getArcadeRankList", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.getArcadeRankList failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetArcadeRankInfo(callback)
	SystemHelper.LogTest("GetArcadeRankInfo")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getArcadeRankInfo", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.getArcadeRankInfo failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.SearchArcadeRankInfo(type, score, callback)
	SystemHelper.LogTest("SearchArcadeRankInfo")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. score .. type .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			score = score,
			type = type,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "searchArcadeRankInfo", paramList, callback)
	else
		SystemHelper.LogTest("SdkHelper.SearchArcadeRankInfo failed. sessionId == nil")

		if callback ~= nil then
			callback(false, nil)
		end
	end
end

function SdkHelper.GetIapInfos(callback)
	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SdkHelper.IsIapInfosInited = false
			SdkHelper.IapInfos = {}
			SdkHelper.OnGetIapInfosCallback = callback

			local productIds = IapData.GetProductIdStr(SdkHelper.CHANNEL)

			SystemHelper.LogError("SdkHelper. productIds " .. productIds)
			SdkHelper.SdkFacade:getIapInfos(productIds)
		elseif callback ~= nil then
			callback(false)
		end
	elseif callback ~= nil then
		callback(false)
	end
end

function SdkHelper.GetPaidList(callback)
	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SystemHelper.LogTest(" Set OnGetPaidListCallback !!!!!!!!!!!!!!!!!!!!!!!!  ")

			SdkHelper.IsPaidListInited = false
			SdkHelper.OnGetPaidListCallback = callback

			SdkHelper.SdkFacade:getPaidList()
		elseif callback ~= nil then
			callback(false)
		end
	elseif callback ~= nil then
		callback(false)
	end
end

function SdkHelper.Pay(productId, accountId, productName, price, callback)
	if SdkHelper.SdkFacade ~= nil then
		if SdkHelper.IsInited() == true then
			SdkHelper.OnCheckPayCallback = callback

			SdkHelper.SdkFacade:pay(SdkHelper.ZONE_ID, accountId, productId, productName, price)
		elseif callback ~= nil then
			callback(false)
		end
	elseif callback ~= nil then
		callback(false)
	end
end

function SdkHelper.openBoard(lang, callback)
	SystemHelper.LogTest("SdkHelper.openBoard")

	local paramList = {}
	local ggurl = SdkHelper.GG_IOS_URL_TAB.us

	if SdkHelper.GG_IOS_URL_TAB[lang] ~= nil then
		ggurl = SdkHelper.GG_IOS_URL_TAB[lang]
	end

	if SdkHelper.CHANNEL == "ANDROID_TAP_TAP" then
		ggurl = SdkHelper.GG_TAPTAP_URL_TAB.us

		if SdkHelper.GG_TAPTAP_URL_TAB[lang] ~= nil then
			ggurl = SdkHelper.GG_TAPTAP_URL_TAB[lang]
		end
	elseif SdkHelper.CHANNEL == "ANDROID_GOOGLE_PLAY" then
		ggurl = SdkHelper.GG_GOOGLE_URL_TAB.us

		if SdkHelper.GG_GOOGLE_URL_TAB[lang] ~= nil then
			ggurl = SdkHelper.GG_GOOGLE_URL_TAB[lang]
		end
	end

	networkMgrHttp:DoGet(ggurl .. "?" .. os.time(), function(success, txt)
		if success == true then
			if callback ~= nil then
				callback(txt)
			end
		else
			callback("")
		end
	end)
end

function SdkHelper.SetGameMode(mode)
	SystemHelper.LogTest("SetGameMode")

	local signStr = tostring(SdkHelper.SessionId) .. mode .. AppConst.SecKey
	local sign = Util.md5(signStr)

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId,
			status = mode,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "clientModel", paramList, function(success, jsonStr)
			return
		end)
	else
		SystemHelper.LogTest("SdkHelper.SetGameMode failed. sessionId == nil")
	end
end

function SdkHelper.UseActiveCode3rd(activeCode, callback)
	SystemHelper.LogTest("UseActiveCode3rd")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local signStr = tostring(SdkHelper.SessionId) .. activeCode .. AppConst.SecKey
		local sign = Util.md5(signStr)
		local paramList = {
			code = activeCode,
			sessionId = SdkHelper.SessionId,
			sign = sign
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "useActiveCode3rd", paramList, function(result, jsonStr)
			SystemHelper.LogTest(jsonStr)

			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							local resultString = tostring(resultData.result.result.activeTime) .. tostring(resultData.result.result.validate) .. AppConst.SecKey

							SystemHelper.LogTest("resultString:" .. resultString)

							local resultSign = Util.md5(resultString)

							SystemHelper.LogTest("resultSign:" .. resultSign)
							SystemHelper.LogTest("sign:" .. resultData.result.result.sign)

							if resultSign == resultData.result.result.sign then
								if callback ~= nil then
									callback(resultData.result.result.validate, resultData.result.result.activeTime)
								end
							elseif callback ~= nil then
								callback(false, -1)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, -1)
					end
				elseif callback ~= nil then
					callback(false, -1)
				end
			elseif callback ~= nil then
				callback(false, -1)
			end
		end)
	else
		SystemHelper.LogTest("UseActiveCode3rd")

		if callback ~= nil then
			callback(false, -1)
		end
	end
end

function SdkHelper.GetActiveTime(callback)
	SystemHelper.LogTest("GetActiveTime")

	if SdkHelper.isLogined == true and SdkHelper.SessionId ~= nil then
		local paramList = {
			sessionId = SdkHelper.SessionId
		}

		networkMgrHttp:DoSSLPost(SdkHelper.SERVER_URL .. "getActiveTime", paramList, function(result, jsonStr)
			SystemHelper.LogTest(jsonStr)

			if result == true then
				if jsonStr ~= nil and jsonStr ~= "" then
					local resultData = json.decode(jsonStr)

					if resultData ~= nil then
						if resultData.success == true then
							local resultString = tostring(resultData.result.activeTime) .. tostring(resultData.result.validate) .. AppConst.SecKey

							SystemHelper.LogTest("resultString:" .. resultString)

							local resultSign = Util.md5(resultString)

							SystemHelper.LogTest("resultSign:" .. resultSign)
							SystemHelper.LogTest("sign:" .. resultData.result.sign)

							if resultSign == resultData.result.sign then
								if callback ~= nil then
									callback(resultData.result.validate, resultData.result.activeTime)
								end
							elseif callback ~= nil then
								callback(false, -1)
							end
						elseif callback ~= nil then
							callback(false, resultData.code)
						end
					elseif callback ~= nil then
						callback(false, -1)
					end
				elseif callback ~= nil then
					callback(false, -1)
				end
			elseif callback ~= nil then
				callback(false, -1)
			end
		end)
	else
		SystemHelper.LogTest("GetActiveTime error")

		if callback ~= nil then
			callback(false, -1)
		end
	end
end

function SdkHelper.IsRunningOnSteamDeck()
	SystemHelper.LogTest("##################################################SdkHelper.IsRunningOnSteamDeck")

	if SdkHelper.SdkFacade ~= nil then
		return SdkHelper.SdkFacade:IsRunningOnSteamDeck()
	end

	return false
end
