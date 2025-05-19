-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/XGame.lua

local lpeg = require("lpeg")

print_r = require("3rd/sproto/print_r")

require("GameData/XDefine")
require("LuaScript/Protocol/XProtocol")
require("LuaScript/XFunctions")
require("LuaScript/UI/UIManager")
require("LuaScript/UI/UILayerCtrl")

XGame = {}

local this = XGame
local loginHttp = "http://192.168.10.136"
local battleIp = "www.tips-works.com"

function XGame.OnInitOK()
	local website = CyDebug.GetWebSite()

	if website == CyDebug.IP_LocalHost then
		AppConst.HttpPort = 9990
		AppConst.HttpAddress = loginHttp
		AppConst.SocketPort = 9501
		AppConst.SocketAddress = battleIp
		AppConst.SocketPortBattleTcp = 9998
		AppConst.SocketAddressBattleTcp = battleIp
		AppConst.SocketPortBattleUdp = 9999
		AppConst.SocketAddressBattleUdp = battleIp
	elseif website == CyDebug.IP_Lan then
		AppConst.HttpPort = 8888
		AppConst.HttpAddress = loginHttp
		AppConst.SocketPort = 9501
		AppConst.SocketAddress = battleIp
		AppConst.SocketPortBattleTcp = 9998
		AppConst.SocketAddressBattleTcp = battleIp
		AppConst.SocketPortBattleUdp = 9999
		AppConst.SocketAddressBattleUdp = battleIp
	elseif website == CyDebug.IP_AliYun then
		AppConst.HttpPort = 9990
		AppConst.HttpAddress = loginHttp
		AppConst.SocketPort = 9501
		AppConst.SocketAddress = battleIp
		AppConst.SocketPortBattleTcp = 9998
		AppConst.SocketAddressBattleTcp = battleIp
		AppConst.SocketPortBattleUdp = 9999
		AppConst.SocketAddressBattleUdp = battleIp
	else
		AppConst.HttpPort = 9990
		AppConst.HttpAddress = loginHttp
		AppConst.SocketPort = 9501
		AppConst.SocketAddress = battleIp
		AppConst.SocketPortBattleTcp = 9998
		AppConst.SocketAddressBattleTcp = battleIp
		AppConst.SocketPortBattleUdp = 9999
		AppConst.SocketAddressBattleUdp = battleIp
	end

	local lang = AppConst.Language

	SystemHelper.Log("[ ====== System Language: " .. lang .. " ====== ]")
	LS_Setting.InitKMC()
	LS_Setting.InitGPC()
	SystemHelper.require("GameData/Internationlization/GameText_" .. LS_Setting.GetLanguage())
	SystemHelper.require("GameData/Internationlization/GameTextAuto_" .. LS_Setting.GetLanguage())
	SystemHelper.require("GameData/Internationlization/GameTextData_" .. LS_Setting.GetLanguage())
	UIManager.Init()
	UILayerCtrl.Init()
	logWarn("LuaFramework InitOK--->>>")
end

function XGame.ChangeBattleIp(ip, port)
	battleIp = ip
	AppConst.SocketAddress = ip
	AppConst.SocketPort = port
	AppConst.SocketAddressBattleTcp = ip
	AppConst.SocketAddressBattleUdp = ip

	SystemHelper.Log(battleIp)
end

function XGame.OnDestroy()
	logWarn("=======================================XGame OnDestroy--->>>")
end
